import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/TransactionsPage.dart';
import 'pages/purchase_page.dart';
import 'pages/void_page.dart';
import 'pages/refund_page.dart';
import 'pages/preauth_page.dart';
import 'pages/void_preauth_page.dart';
import 'pages/preauth_completion_page.dart';
import 'pages/tip_page.dart';
import 'pages/tip_completion_page.dart';
import 'pages/cash_advance_page.dart';
import 'pages/sign_in_page.dart'; // Updated import
import 'pages/settlement_page.dart';
import 'pages/bill_page.dart';
import 'pages/reprint_page.dart';
import 'pages/report_page.dart';
import 'pages/params_page.dart';
import 'pages/system_info_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POS Terminal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/transactions': (context) => TransactionsPage(),
        '/purchase': (context) => PurchasePage(),
        '/void': (context) => VoidPage(
            transactions: []), // Provide an initial empty list or with your existing list if available
        '/refund': (context) => RefundPage(),
        '/preauth': (context) => PreAuthPage(),
        '/void_preauth': (context) => VoidPreauthPage(),
        '/preauth_completion': (context) => PreAuthCompletionPage(),
        '/tip': (context) => TipPage(originalAmount: 0.0),
        '/tip_completion': (context) => TipCompletionPage(),
        '/cash_advance': (context) => CashAdvancePage(),
        '/sign_in': (context) => SignInPage(), // Corrected page name
        '/settlement': (context) => SettlementPage(),
        '/bill': (context) => BillPage(
              transactionId: '12345',
              transactionDateTime: DateTime.now(),
              items: [
                Item(name: 'Item 1', quantity: 2, price: 20.0),
                Item(name: 'Item 2', quantity: 1, price: 15.0),
              ],
              subtotal: 35.0,
              taxesAndFees: 5.0,
              totalAmount: 40.0,
            ),
        '/reprint': (context) => ReprintPage(),
        '/report': (context) => ReportPage(),
        '/params': (context) => ParamsPage(),
        '/system_info': (context) => SystemInfoPage(),
      },
    );
  }
}
