import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? selectedUserType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/your-img.png', // Replace with the path to your image
                height: 250,
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                hint: Text('Select User Type'),
                value: selectedUserType,
                items: ['Admin', 'Moderator'].map((String userType) {
                  return DropdownMenuItem<String>(
                    value: userType,
                    child: Text(userType),
                  );
                }).toList(),
                onChanged: (String? value) {
                  // Handle user type selection
                  setState(() {
                    selectedUserType = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle sign-in logic
                  if (selectedUserType == 'Admin') {
                    print('Admin Sign In: Password logic goes here');
                  } else if (selectedUserType == 'Moderator') {
                    print('Moderator Sign In: Password logic goes here');
                  }
                  // You can replace the print statements with actual authentication logic.
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Button background color
                  onPrimary: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0), // Square button
                  ),
                ),
                child: Text('Sign In'),
              ),
              SizedBox(height: 20),
              if (selectedUserType != null)
                Text('Selected User Type: $selectedUserType'),
            ],
          ),
        ),
      ),
    );
  }
}
