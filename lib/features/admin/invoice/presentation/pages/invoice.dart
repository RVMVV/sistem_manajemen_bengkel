import 'package:bengkel_pak_bowo/core/constants_finals.dart';
import 'package:bengkel_pak_bowo/features/admin/invoice/presentation/cubit/invoice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final InvoiceCubit invoiceCubit = context.read<InvoiceCubit>();

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              centerTitle: true,
              title: Text('Transaksi'),
            ),
          ];
        },
        body: BlocBuilder<InvoiceCubit, InvoiceState>(
          bloc: invoiceCubit..getInvoices(),
          buildWhen: (previous, current) => current is ReadInvoice,
          builder: (context, state) {
            // Loading
            if (state is ReadInvoiceLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // Loaded
            if (state is ReadInvoiceLoaded) {
              return RefreshIndicator(
                displacement: 10,
                onRefresh: () async => invoiceCubit.getInvoices(),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        invoiceCubit.invoice = state.data[index];
                        Navigator.of(context).pushNamed(detailInvoicePage);
                      },
                      subtitle: Text(
                        DateFormat('d-M-y H:m')
                            .format(state.data[index].boughtAt),
                      ),
                      title: Text(state.data[index].namaPelanggan),
                      trailing: Text(
                        'Rp. ${state.data[index].getTotalHarga}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                  itemCount: state.data.length,
                ),
              );
            }
            return Center(
              child: ElevatedButton(
                onPressed: () => invoiceCubit.getInvoices(),
                child: const Text('Ulangi'),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(makeInvoicePage),
        child: const Icon(Icons.add),
      ),
    );
  }
}
