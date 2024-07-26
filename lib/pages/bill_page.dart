import 'package:flutter/material.dart';

class BillPage extends StatelessWidget {
  final String transactionId;
  final DateTime transactionDateTime;
  final List<Item> items;
  final double subtotal;
  final double taxesAndFees;
  final double totalAmount;

  BillPage({
    required this.transactionId,
    required this.transactionDateTime,
    required this.items,
    required this.subtotal,
    required this.taxesAndFees,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildTransactionDetails(),
            SizedBox(height: 20.0),
            buildItemsSection(),
            SizedBox(height: 20.0),
            buildTaxesAndFeesSection(),
            SizedBox(height: 20.0),
            buildTotalAmountSection(),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Transaction ID: $transactionId'),
        Text('Date and Time: ${transactionDateTime.toString()}'),
      ],
    );
  }

  Widget buildItemsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Items Purchased:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        // Create a ListTile for each item
        for (var item in items)
          ListTile(
            title: Text(item.name),
            subtitle:
                Text('Quantity: ${item.quantity} - Price: ${item.price} DHS'),
          ),
        SizedBox(height: 10.0),
        Text('Subtotal: $subtotal DHS'),
      ],
    );
  }

  Widget buildTaxesAndFeesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Taxes and Fees:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Text('Taxes: $taxesAndFees %'),
      ],
    );
  }

  Widget buildTotalAmountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Amount:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Text('Grand Total: $totalAmount DHS'),
      ],
    );
  }
}

class Item {
  final String name;
  final int quantity;
  final double price;

  Item({
    required this.name,
    required this.quantity,
    required this.price,
  });
}
