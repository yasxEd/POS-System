import 'package:flutter/material.dart';

class Transaction {
  final int id;
  final double amount;

  Transaction({required this.id, required this.amount});
}

class VoidPage extends StatefulWidget {
  final List<Transaction> transactions;

  VoidPage({required this.transactions});

  @override
  _VoidPageState createState() => _VoidPageState();
}

class _VoidPageState extends State<VoidPage> {
  double totalVoidedAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Void Transactions'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildVoidTable(),
          SizedBox(height: 16.0),
          buildTotalVoidedAmount(),
          SizedBox(height: 16.0),
          buildVoidAllButton(),
          SizedBox(height: 16.0),
          buildGoBackButton(),
        ],
      ),
    );
  }

  Widget buildVoidTable() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: DataTable(
          columns: [
            DataColumn(
              label: Center(child: Text('ID')),
              numeric: false,
            ),
            DataColumn(
              label: Center(child: Text('Amount')),
              numeric: true,
            ),
            DataColumn(
              label: Center(child: Text('Void')),
              numeric: false,
            ),
          ],
          rows: [
            ...widget.transactions.map((transaction) {
              return DataRow(cells: [
                DataCell(
                  Center(child: Text(transaction.id.toString())),
                ),
                DataCell(
                  Center(child: Text(transaction.amount.toString())),
                ),
                DataCell(
                  SizedBox(
                    width: 70.0,
                    height: 35.0,
                    child: ElevatedButton(
                      onPressed: () {
                        showVoidConfirmationDialog(transaction);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      child: Text(
                        'Void',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ]);
            }),
            // Add two empty rows
            DataRow(cells: [
              DataCell(Text('')),
              DataCell(Text('')),
              DataCell(
                SizedBox(
                  width: 70.0,
                  height: 35.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle voiding logic for the first empty row
                      // For now, let's show a message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Transaction Voided.'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 30, 30, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Text(
                      'Void',
                      style: TextStyle(
                        fontSize: 10.5,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            DataRow(cells: [
              DataCell(Text('')),
              DataCell(Text('')),
              DataCell(
                SizedBox(
                  width: 70.0,
                  height: 35.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle voiding logic for the second empty row
                      // For now, let's show a message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Transaction Voided.'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 31, 31, 31),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Text(
                      'Void',
                      style: TextStyle(
                        fontSize: 10.5,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildTotalVoidedAmount() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          'Total Voided Amount: ${totalVoidedAmount.toStringAsFixed(2)} DHS',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildVoidAllButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Void all transactions and update the UI
          voidAllTransactions();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('All transactions voided.'),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 31, 31, 31),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: Text(
          'Void All Transactions',
          style: TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }

  Widget buildGoBackButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Navigate back to the home page
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 31, 31, 31),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: Text(
          'Go Back',
          style: TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }

  void showVoidConfirmationDialog(Transaction transaction) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Void'),
          content: Text('Do you want to void this transaction?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Void the transaction and update the UI
                voidTransaction(transaction);
                Navigator.pop(context); // Close the dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Transaction voided.'),
                  ),
                );
              },
              child: Text('Void'),
            ),
          ],
        );
      },
    );
  }

  void voidTransaction(Transaction transaction) {
    setState(() {
      totalVoidedAmount += transaction.amount;
      widget.transactions
          .remove(transaction); // Remove the voided transaction from the list
    });

    // Implement the logic to void the transaction with the given ID
    // You may want to update your data model or notify your backend
    // For simplicity, you can print a message for now
    print('Transaction ${transaction.id} voided.');
  }

  void voidAllTransactions() {
    setState(() {
      totalVoidedAmount = widget.transactions.fold(
        0.0,
        (previous, transaction) => previous + transaction.amount,
      );
      widget.transactions.clear(); // Remove all transactions
    });

    // Implement the logic to void all transactions
    // You may want to update your data model or notify your backend
    // For simplicity, you can print a message for now
    print('All transactions voided.');
  }
}
