import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart';

import '../../data/models/invoice.dart';

Future<Uint8List> makePDF(final InvoiceModel invoice) async {
  final Document pdf = Document();

  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          children: [
            Text(
              'Bengkel Pak Bowo',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Alamat Bengkel Pak Bowo',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Nomor Telepon',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Nomor Invoice - ${DateFormat('d/M/y').format(invoice.boughtAt)}',
              style: const TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nama Jasa',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Harga',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Divider(),
            ListView.separated(
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      invoice.services[index].nama,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Rp. ${invoice.services[index].formattedHarga}',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemCount: invoice.services.length,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Harga',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp. ${invoice.formattedTotalHarga}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    ),
  );
  
  return pdf.save();
}
