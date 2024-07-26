import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ParamsPage(),
    );
  }
}

class ParamsPage extends StatefulWidget {
  @override
  _ParamsPageState createState() => _ParamsPageState();
}

class _ParamsPageState extends State<ParamsPage> {
  bool enableTips = true;
  bool enableRefunds = true;
  double tipPercentage = 15.0;
  String currencySymbol = 'DHS';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terminal Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Currency Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            buildCurrencySymbolDropdown(
              'Currency Symbol',
              currencySymbol,
              (value) {
                setState(() {
                  currencySymbol = value ?? 'DHS'; // Default to 'DHS' if null
                });
              },
            ),
            SizedBox(height: 30),
            Text(
              'Transaction Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            buildSwitchTile(
              'Enable Tips',
              enableTips,
              (value) {
                setState(() {
                  enableTips = value;
                });
              },
            ),
            buildSwitchTile(
              'Enable Refunds',
              enableRefunds,
              (value) {
                setState(() {
                  enableRefunds = value;
                });
              },
            ),
            SizedBox(height: 30),
            Text(
              'Tip Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            buildSlider(
              'Tip Percentage',
              tipPercentage,
              (value) {
                setState(() {
                  tipPercentage = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwitchTile(
      String title, bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget buildSlider(
      String title, double value, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Slider(
          value: value,
          onChanged: onChanged,
          min: 0.0,
          max: 30.0,
          divisions: 30,
          label: '$value%',
        ),
      ],
    );
  }

  Widget buildCurrencySymbolDropdown(
      String title, String value, ValueChanged<String?> onChanged) {
    List<String> currencySymbols = [
      'DHS',
      '\$',
      '€',
      '£',
      '¥'
    ]; // Add more as needed

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        DropdownButton<String>(
          value: value,
          onChanged: (String? newValue) {
            onChanged(newValue);
          },
          items: currencySymbols.map((String symbol) {
            return DropdownMenuItem<String>(
              value: symbol,
              child: Text(symbol),
            );
          }).toList(),
        ),
      ],
    );
  }
}
