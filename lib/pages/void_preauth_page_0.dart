import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VoidPreauthPage(),
    );
  }
}

class VoidPreauthPage extends StatefulWidget {
  @override
  _VoidPreauthPageState createState() => _VoidPreauthPageState();
}

class _VoidPreauthPageState extends State<VoidPreauthPage> {
  TextEditingController _transactionIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Void Preauth'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter Transaction ID to Void Preauthorization:',
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
            ElevatedButton(
              onPressed: () {
                voidPreauthTransaction();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Background color
                onPrimary: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Make it square
                ),
              ),
              child: Text('Void Preauthorization'),
            ),
          ],
        ),
      ),
    );
  }

  void voidPreauthTransaction() {
    // Retrieve the transaction ID from the controller
    String transactionId = _transactionIdController.text;

    // Implement logic to void preauthorization using the provided transaction ID
    // For demonstration purposes, print a message
    print('Voiding preauthorization for Transaction ID: $transactionId');

    // Optionally, you can navigate back or perform other actions after voiding
  }

  @override
  void dispose() {
    // Dispose of the controller to free up resources
    _transactionIdController.dispose();
    super.dispose();
  }
}
