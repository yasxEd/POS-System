import 'package:flutter/material.dart';

class SettlementPage extends StatefulWidget {
  @override
  _SettlementPageState createState() => _SettlementPageState();
}

class _SettlementPageState extends State<SettlementPage> {
  double settlementAmount = 0.0;
  bool isSettlementInProgress = false;
  bool isSettlementSuccessful = false;
  String settlementResponse = "";
  String paymentMethod = "Credit Card";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settlement'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              // Navigate to settlement history page
              // Add your navigation logic here
            },
          ),
        ],
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
                      decoration:
                          InputDecoration(labelText: 'Settlement Amount'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid amount';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          settlementAmount = double.parse(value);
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
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton.icon(
                onPressed:
                    isSettlementInProgress ? null : () => initiateSettlement(),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 23, 23, 23),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                icon: Icon(Icons.payment),
                label: isSettlementInProgress
                    ? Text('Processing...')
                    : Text('Initiate Settlement'),
              ),
              SizedBox(height: 16.0),
              if (isSettlementSuccessful)
                Card(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Settlement Successful!',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Amount: \$${settlementAmount.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Payment Method: $paymentMethod',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              if (isSettlementInProgress && !isSettlementSuccessful)
                LinearProgressIndicator(
                    color: const Color.fromARGB(255, 25, 25, 25)),
              if (!isSettlementInProgress && isSettlementSuccessful)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isSettlementSuccessful = false;
                      settlementResponse = "";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 32, 32, 32),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Text('Back to Home'),
                ),
              SizedBox(height: 16.0),
              if (settlementResponse.isNotEmpty)
                Text(
                  'Response: $settlementResponse',
                  style: TextStyle(color: Colors.black),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void initiateSettlement() {
    if (formKey.currentState!.validate()) {
      setState(() {
        isSettlementInProgress = true;
        settlementResponse = "";
      });

      // Simulate an asynchronous settlement process
      Future.delayed(Duration(seconds: 2), () {
        // Perform the logic to process the settlement
        setState(() {
          isSettlementSuccessful = true;
          settlementResponse =
              'Settlement successful. Amount: \$${settlementAmount.toStringAsFixed(2)}';
          isSettlementInProgress = false;
        });
      });
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: SettlementPage(),
  ));
}
