import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TipPage extends StatefulWidget {
  final double originalAmount;

  TipPage({required this.originalAmount});

  @override
  _TipPageState createState() => _TipPageState();
}

class _TipPageState extends State<TipPage> {
  TextEditingController tipController = TextEditingController();
  double tipPercentage = 0.15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildTipPage(),
      ),
    );
  }

  Widget buildTipPage() {
    double tipAmount = widget.originalAmount * tipPercentage;
    double totalAmount = widget.originalAmount + tipAmount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildTransactionDetails(),
        SizedBox(height: 30.0),
        buildTipEntryField(),
        SizedBox(height: 30.0),
        buildTipPercentageOptions(),
        SizedBox(height: 30.0),
        buildTotalAmount(totalAmount),
        SizedBox(height: 30.0),
        buildButtonsRow(),
        SizedBox(height: 16.0),
        buildTipGuidelines(),
      ],
    );
  }

  Widget buildTransactionDetails() {
    return Text(
      'Transaction Details',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget buildTipEntryField() {
    return TextFormField(
      controller: tipController,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}$')),
      ],
      decoration: InputDecoration(
        labelText: 'Enter Tip Amount',
        prefixText: 'DHS ',
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      onChanged: (value) {
        // Handle tip amount changes
        // You may want to validate and update the tip amount accordingly
      },
    );
  }

  Widget buildTipPercentageOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () => setTipPercentage(0.1),
          style: ElevatedButton.styleFrom(
            primary:
                const Color.fromARGB(255, 20, 20, 20), // Change button color
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text('10%',
              style: TextStyle(color: Colors.white)), // Change text color
        ),
        ElevatedButton(
          onPressed: () => setTipPercentage(0.15),
          style: ElevatedButton.styleFrom(
            primary:
                const Color.fromARGB(255, 30, 30, 30), // Change button color
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text('15%',
              style: TextStyle(color: Colors.white)), // Change text color
        ),
        ElevatedButton(
          onPressed: () => setTipPercentage(0.2),
          style: ElevatedButton.styleFrom(
            primary:
                const Color.fromARGB(255, 28, 28, 28), // Change button color
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text('20%',
              style: TextStyle(color: Colors.white)), // Change text color
        ),
      ],
    );
  }

  Widget buildTotalAmount(double totalAmount) {
    return Text(
      'Total Amount: ${totalAmount.toStringAsFixed(2)} DHS',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget buildButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildConfirmationButton(),
        buildCancelButton(),
      ],
    );
  }

  Widget buildConfirmationButton() {
    return ElevatedButton(
      onPressed: () {
        // Process the transaction with the entered tip
        // You may want to navigate to a confirmation screen or perform other actions
      },
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 28, 28, 28), // Change button color
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: Text('Confirm Transaction',
          style: TextStyle(color: Colors.white)), // Change text color
    );
  }

  Widget buildCancelButton() {
    return TextButton(
      onPressed: () {
        // Navigate back to the previous screen or cancel the tip entry
      },
      style: TextButton.styleFrom(
        side: BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: Text('Cancel', style: TextStyle(color: Colors.black)),
      // Change text color
    );
  }

  Widget buildTipGuidelines() {
    return Text(
      'Tip Guidelines: Your tip helps support our staff. Thank you!',
      style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
    );
  }

  void setTipPercentage(double percentage) {
    setState(() {
      tipPercentage = percentage;
    });
  }
}
