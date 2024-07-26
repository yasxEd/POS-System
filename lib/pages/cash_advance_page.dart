import 'package:flutter/material.dart';

class CashAdvancePage extends StatefulWidget {
  @override
  _CashAdvancePageState createState() => _CashAdvancePageState();
}

class _CashAdvancePageState extends State<CashAdvancePage> {
  double cashAmount = 0.0;
  bool isCashAdvanceSuccessful = false;
  String cashAdvanceResponse = "";
  String paymentMethod = "Credit Card";
  String reason = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cash Advance'),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Cash Amount'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid amount';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          cashAmount = double.parse(value);
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    DropdownButtonFormField<String>(
                      value: paymentMethod,
                      onChanged: (value) {
                        setState(() {
                          paymentMethod = value!;
                        });
                      },
                      items:
                          ['Credit Card', 'Debit Card', 'Cash'].map((method) {
                        return DropdownMenuItem<String>(
                          value: method,
                          child: Text(method),
                        );
                      }).toList(),
                      decoration: InputDecoration(labelText: 'Payment Method'),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Reason'),
                      onChanged: (value) {
                        setState(() {
                          reason = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  initiateCashAdvance();
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 23, 23, 23),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text('Initiate Cash Advance'),
              ),
              SizedBox(height: 16.0),
              if (isCashAdvanceSuccessful)
                Card(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Cash Advance Successful!',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Amount: \$${cashAmount.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Payment Method: $paymentMethod',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Reason: $reason',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isCashAdvanceSuccessful = false;
                    cashAdvanceResponse = "";
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 22, 22, 22),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initiateCashAdvance() {
    if (formKey.currentState!.validate()) {
      // Perform the logic to process the cash advance
      setState(() {
        isCashAdvanceSuccessful = true;
        cashAdvanceResponse =
            'Cash Advance successful. Amount: \$${cashAmount.toStringAsFixed(2)}';
      });
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: CashAdvancePage(),
  ));
}
