import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionsPage extends StatelessWidget {
  static const double _screenPadding = 16.0;
  static const double _cardSizeFactor = 1.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: Padding(
        padding: EdgeInsets.all(_screenPadding),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
          ),
          itemCount: operations.length,
          itemBuilder: (context, index) {
            return _buildOperationCard(
              context,
              operations[index].title,
              operations[index].route,
              operations[index].icon,
            );
          },
        ),
      ),
    );
  }

  Widget _buildOperationCard(
      BuildContext context, String title, String route, IconData icon) {
    double cardWidth =
        (MediaQuery.of(context).size.width - 4 * _screenPadding) /
            3 *
            _cardSizeFactor;

    return Card(
      color: Colors.black, // Set card background color to black
      elevation: 4.0,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: () {
            if (route == '/tip_completion') {
              _showTipCompletionDialog(context);
            } else {
              Navigator.pushNamed(context, route);
            }
          },
          child: Container(
            padding: EdgeInsets.all(16.0),
            width: cardWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  icon,
                  size: 25.0,
                  color: Colors.white, // Set icon color to white
                ),
                SizedBox(height: 8.0),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.white, // Set text color to white
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showTipCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController tipController = TextEditingController();

        return AlertDialog(
          title: Text('Tip Completion'),
          content: Column(
            children: [
              TextField(
                controller: tipController,
                decoration: InputDecoration(labelText: 'Enter Tip Amount'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                double tipAmount = double.tryParse(tipController.text) ?? 0.0;
                Navigator.pop(
                    context, tipAmount); // Close the dialog and pass tipAmount
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    ).then((tipAmount) {
      if (tipAmount != null) {
        Navigator.pushNamed(
          context,
          '/tip',
          arguments: {'originalAmount': tipAmount},
        );
      }
    });
  }
}

class Operation {
  final String title;
  final String route;
  final IconData icon;

  Operation(this.title, this.route, this.icon);
}

final List<Operation> operations = [
  Operation('PURCHASE', '/purchase', FontAwesomeIcons.shoppingCart),
  Operation('VOID', '/void', FontAwesomeIcons.times),
  Operation('REFUND', '/refund', FontAwesomeIcons.undo),
  Operation('PRE-AUTH', '/preauth', FontAwesomeIcons.creditCard),
  Operation('VOID PRE-AUTH', '/void_preauth',
      FontAwesomeIcons.timesCircle), // Updated icon
  Operation(
      'PRE-AUTH COMPLETION', '/preauth_completion', FontAwesomeIcons.check),
  Operation('TIP', '/tip', FontAwesomeIcons.moneyBillAlt),
  Operation('TIP COMPLETION', '/tip_completion', FontAwesomeIcons.checkDouble),
  Operation('CASH ADVANCE', '/cash_advance', FontAwesomeIcons.moneyBill),
  Operation('SIGN IN', '/sign_in', FontAwesomeIcons.user),
  Operation('SETTLEMENT', '/settlement', FontAwesomeIcons.checkSquare),
  Operation('BILL', '/bill', FontAwesomeIcons.receipt),
  Operation('REPRINT', '/reprint', FontAwesomeIcons.print),
  Operation('REPORT', '/report', FontAwesomeIcons.chartBar),
  Operation('PARAMS', '/params', FontAwesomeIcons.slidersH),
  Operation('SYSTEM INFO', '/system_info', FontAwesomeIcons.info),
];
