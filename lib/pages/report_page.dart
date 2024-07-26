import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReportPage(),
    );
  }
}

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Summary Report',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Total Sales: 5000.00 DHS',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Total Refunds: 200.00 DHS',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Net Sales: 4800.00 DHS',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            Text(
              'Transaction Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  buildTransactionItem('Transaction ID: 12345',
                      'Amount: 100.00 DHS', 'Type: Purchase'),
                  buildTransactionItem('Transaction ID: 67890',
                      'Amount: 50.00 DHS', 'Type: Refund'),
                  // Add more transaction items as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionItem(
      String transactionId, String amount, String type) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(transactionId),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(amount),
            Text(type),
          ],
        ),
        onTap: () {
          // Implement action when tapping on a transaction item
        },
      ),
    );
  }
}
