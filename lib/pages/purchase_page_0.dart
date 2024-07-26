import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PurchasePage extends StatefulWidget {
  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  String amount = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: amount),
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 26.0,
                      fontFamily: 'Poppins',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Amount',
                      contentPadding: EdgeInsets.all(26.0),
                      suffixText: 'DHS',
                      suffixStyle: TextStyle(
                        fontSize: 26.0,
                        fontFamily: 'Poppins',
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 26.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 38.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 11,
                itemBuilder: (context, index) {
                  String cardText = (index == 10) ? '.' : '$index';
                  return GestureDetector(
                    onTap: () {
                      handleCardClick(cardText);
                    },
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color:
                              Color.fromARGB(255, 36, 36, 36).withOpacity(0.2),
                          width: 2.0,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 23, 23, 23)
                                  .withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color:
                              Color.fromARGB(255, 39, 39, 39).withOpacity(0.9),
                        ),
                        child: Center(
                          child: Text(
                            cardText,
                            style: TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    handleBackspace();
                  },
                  style: ElevatedButton.styleFrom(
                    primary:
                        Colors.red.withOpacity(0.8), // Set the button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Icon(Icons.backspace, color: Colors.white, size: 30.0),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle edit button click
                    // You can add custom logic for editing here
                  },
                  style: ElevatedButton.styleFrom(
                    primary:
                        Colors.blue.withOpacity(0.8), // Set the button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.edit,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle confirm button click
                    // You can add custom logic for confirming here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    // Set the button color
                  ),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void handleCardClick(String cardText) {
    if ((amount.isEmpty && cardText != '0' && cardText != '.') ||
        (amount.isNotEmpty)) {
      setState(() {
        amount += cardText;
      });
    }
  }

  void handleBackspace() {
    if (amount.isNotEmpty) {
      setState(() {
        amount = amount.substring(0, amount.length - 1);
      });
    }
  }
}
