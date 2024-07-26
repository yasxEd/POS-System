import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PreAuthPage extends StatefulWidget {
  @override
  _PreAuthPageState createState() => _PreAuthPageState();
}

class _PreAuthPageState extends State<PreAuthPage> {
  double transactionAmount = 100.0;
  String customerName = "";
  String paymentMethod = "Credit Card";
  String cardNumber = "4242 4242 4242 4242"; // Example card number
  String cardHolderName = "";
  String expiryDate = "12/23";
  String cvvCode = "123"; // Example CVV code
  bool isCvvFocused = false;
  bool isPreAuthSuccessful = false;
  String preAuthResponse = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> cardNumberKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> expiryDateKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> cardHolderKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> cvvCodeKey =
      GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pre-Authorization'),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: paymentMethod,
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value!;
                  });
                },
                items: ['Credit Card', 'Debit Card', 'Other'].map((method) {
                  return DropdownMenuItem<String>(
                    value: method,
                    child: Text(method),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Payment Method'),
              ),
              SizedBox(height: 16.0),
              if (paymentMethod == 'Credit Card')
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  bankName: 'Bank',
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  glassmorphismConfig: Glassmorphism.defaultConfig(),
                  enableFloatingCard: true,
                  floatingConfig: FloatingConfig(
                    isGlareEnabled: true,
                    isShadowEnabled: true,
                    shadowConfig: FloatingShadowConfig(
                      offset: Offset(0, 0),
                      color: Color.fromARGB(255, 14, 14, 14),
                      blurRadius: 0,
                    ),
                  ),
                  onCreditCardWidgetChange:
                      (CreditCardBrand creditCardBrand) {},
                  customCardTypeIcons: <CustomCardTypeIcon>[
                    CustomCardTypeIcon(
                      cardType: CardType.mastercard,
                      cardImage: Image.asset(
                        'assets/mastercard.png',
                        height: 48,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 16.0),
              CreditCardForm(
                formKey: formKey,
                cardNumberKey: cardNumberKey,
                expiryDateKey: expiryDateKey,
                cardHolderKey: cardHolderKey,
                cvvCodeKey: cvvCodeKey,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                obscureCvv: true,
                obscureNumber: true,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                enableCvv: true,
                cvvValidationMessage: 'Please input a valid CVV',
                dateValidationMessage: 'Please input a valid date',
                numberValidationMessage: 'Please input a valid number',
                cardNumberValidator: (String? cardNumber) {
                  // Your validation logic here
                  return null;
                },
                expiryDateValidator: (String? expiryDate) {
                  // Your validation logic here
                  return null;
                },
                cvvValidator: (String? cvv) {
                  // Your validation logic here
                  return null;
                },
                cardHolderValidator: (String? cardHolderName) {
                  // Your validation logic here
                  return null;
                },
                onCreditCardModelChange: (CreditCardModel creditCardModel) {
                  setState(() {
                    cardNumber = creditCardModel.cardNumber;
                    expiryDate = creditCardModel.expiryDate;
                    cardHolderName = creditCardModel.cardHolderName;
                    cvvCode = creditCardModel.cvvCode;
                    isCvvFocused = creditCardModel.isCvvFocused;
                  });
                },
                onFormComplete: () {
                  // callback to execute at the end of filling card data
                },
                autovalidateMode: AutovalidateMode.always,
                disableCardNumberAutoFillHints: false,
                inputConfiguration: const InputConfiguration(
                  cardNumberDecoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number',
                  ),
                  expiryDateDecoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Expired Date',
                    hintText: 'XX/XX',
                  ),
                  cvvCodeDecoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CVV',
                    hintText: 'XXX',
                  ),
                  cardHolderDecoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Card Holder',
                  ),
                  cardNumberTextStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                  cardHolderTextStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                  expiryDateTextStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                  cvvCodeTextStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Customer Name'),
                onChanged: (value) {
                  setState(() {
                    customerName = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Transaction : ${transactionAmount.toStringAsFixed(2)} \DHS'),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        transactionAmount += 50.0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 21, 21, 21),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Text('Increase Amount'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  initiatePreAuth();
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 22, 22, 22),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text('Initiate Pre-Authorization'),
              ),
              SizedBox(height: 16.0),
              if (isPreAuthSuccessful)
                Text(
                  'Pre-Authorization Successful!\nResponse: $preAuthResponse',
                  style: TextStyle(color: Colors.green),
                ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isPreAuthSuccessful = false;
                    preAuthResponse = "";
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 27, 27, 27),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text('Cancel / Modify Pre-Authorization'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initiatePreAuth() {
    setState(() {
      isPreAuthSuccessful = true;
      preAuthResponse = 'Pre-Authorization successful. Reference: ABC123';
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: PreAuthPage(),
  ));
}
