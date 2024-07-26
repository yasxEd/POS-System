import 'package:flutter/material.dart';

class RefundPage extends StatefulWidget {
  @override
  _RefundPageState createState() => _RefundPageState();
}

class _RefundPageState extends State<RefundPage> {
  TextEditingController _amountController = TextEditingController();
  TextEditingController _notesController = TextEditingController();
  String? _selectedReason;
  DateTime? _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refund Page'),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter Refund Amount'),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedReason,
                hint: Text('Select Refund Reason'),
                onChanged: (value) {
                  setState(() {
                    _selectedReason = value;
                  });
                },
                items: [
                  'Defective Product',
                  'Wrong Item',
                  'Customer Request',
                  'Other'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                      'Refund Date: ${_selectedDate?.toLocal()}'.split(' ')[0]),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (pickedDate != null && pickedDate != _selectedDate) {
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      primary: const Color.fromARGB(
                          255, 27, 27, 27), // Change the color
                    ),
                    child: Text(
                      'Select Date',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                controller: _notesController,
                maxLines: 3,
                decoration: InputDecoration(labelText: 'Additional Notes'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _processRefund();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  primary: const Color.fromARGB(
                      255, 32, 32, 32), // Change the button color
                ),
                child: Text(
                  'Process Refund',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void _processRefund() {
    // Validate and process the refund
    if (_amountController.text.isEmpty || _selectedReason == null) {
      _showErrorDialog('Please fill in all required fields.');
      return;
    }

    double refundAmount = double.tryParse(_amountController.text) ?? 0.0;

    if (refundAmount <= 0) {
      _showErrorDialog('Refund amount must be greater than zero.');
      return;
    }

    // Perform the refund processing logic here
    // You can call your backend API or perform any other necessary actions

    _showSuccessDialog(
        'Refund processed successfully: \$${refundAmount.toString()}');
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // You can navigate back or perform any other action after refund success
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RefundPage(),
  ));
}
