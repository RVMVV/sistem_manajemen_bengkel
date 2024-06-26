import 'package:bengkel_pak_bowo/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/invoice/data/models/barang.dart';

// API
// const String url = 'https://bengkel-pak-bowo-services.vercel.app/';
const String url = 'http://10.0.2.2:3001/';

final Map<String, String> endpoint = {
  'invoice': 'invoice',
  'login': 'login',
  'register': 'register',
  'queue': 'queue',
  'queueNum': 'queueNum',
  'queueMe': 'queueMe'
};
final Map<String, String> headers = {
  'Content-Type': 'application/json',
  'Authorization': locator<SharedPreferences>().getString('token') ?? '',
};

// route name
const String initialRoute = '/';
const String registerPage = '${initialRoute}register/';
const String loginPage = '${initialRoute}login/';
const String invoicePage = '${initialRoute}invoice/';
const String makeInvoicePage = '${invoicePage}make/';
const String detailInvoicePage = '${invoicePage}detail/';
const String previewInvoicePage = '${invoicePage}preview/';
const String homePage = '${initialRoute}home/';
const String queuePage = '${initialRoute}detailAntrian/';

final List<ServiceModel> items = [
  ServiceModel(nama: 'Cat Full Body', harga: 12000000),
  ServiceModel(nama: 'Cat Per Panel', harga: 700000),
  ServiceModel(nama: 'Poles Cat Body', harga: 800000),
  ServiceModel(nama: 'Servis AC', harga: 1100000),
  ServiceModel(nama: 'Tune Up', harga: 600000),
  ServiceModel(nama: 'Modif Body Full Cat', harga: 15000000),
  ServiceModel(nama: 'Ganti Kapas Kopling', harga: 500000),
];
