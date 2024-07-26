import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PreAuthCompletionPage(),
    );
  }
}

class PreAuthCompletionPage extends StatefulWidget {
  @override
  _PreAuthCompletionPageState createState() => _PreAuthCompletionPageState();
}

class _PreAuthCompletionPageState extends State<PreAuthCompletionPage> {
  TextEditingController _transactionIdController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PreAuth Completion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter Transaction ID and Amount for PreAuth Completion:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _transactionIdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Transaction ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                preAuthCompletionTransaction();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: Text('PreAuth Completion'),
            ),
          ],
        ),
      ),
    );
  }

  void preAuthCompletionTransaction() {
    // Retrieve the transaction ID and amount from the controllers
    String transactionId = _transactionIdController.text;
    double amount = double.tryParse(_amountController.text) ?? 0.0;

    // Implement logic to complete preauthorization using the provided details
    // For demonstration purposes, print a message
    print(
        'Completing preauthorization for Transaction ID: $transactionId with Amount: $amount');

    // Optionally, you can navigate back or perform other actions after completing
  }

  @override
  void dispose() {
    // Dispose of the controllers to free up resources
    _transactionIdController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
