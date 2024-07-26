import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReprintPage(),
    );
  }
}

class Transaction {
  final String transactionId;
  final String date;
  final double amount;

  Transaction(
      {required this.transactionId, required this.date, required this.amount});
}

class ReprintPage extends StatefulWidget {
  @override
  _ReprintPageState createState() => _ReprintPageState();
}

class _ReprintPageState extends State<ReprintPage> {
  List<Transaction> transactions = [
    Transaction(transactionId: '12345', date: '2023-01-01', amount: 50.0),
    Transaction(transactionId: '67890', date: '2023-02-15', amount: 30.0),
    // Add more transactions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reprint Transactions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a Transaction to Reprint:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return buildTransactionItem(transactions[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionItem(Transaction transaction) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text('Transaction ID: ${transaction.transactionId}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: ${transaction.date}'),
            Text(
                'Amount: ${transaction.amount} DHS'), // Adjust the currency as needed
          ],
        ),
        onTap: () {
          // Implement reprint functionality here
          showReprintDialog(transaction);
        },
      ),
    );
  }

  void showReprintDialog(Transaction transaction) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reprint Confirmation'),
          content: Text(
              'Do you want to reprint Transaction ID ${transaction.transactionId}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement the reprint action here
                reprintTransaction(transaction);
                Navigator.of(context).pop();
              },
              child: Text('Reprint'),
            ),
          ],
        );
      },
    );
  }

  void reprintTransaction(Transaction transaction) {
    // Display receipt as a bill dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Receipt - Transaction ID: ${transaction.transactionId}'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Date: ${transaction.date}'),
              Text(
                  'Amount: ${transaction.amount} DHS'), // Adjust the currency as needed
              SizedBox(height: 20),
              Text('Thank you for your purchase!'),
              // Add more details as needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
