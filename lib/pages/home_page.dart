import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'transactionsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Dummy data for mid, tid, and version
  String mid = '123456789';
  String tid = '987654321';
  String version = '1.4.5';

  // Settings
  String language = 'English';
  String theme = 'Dark';
  String notifications = 'On';
  String currency = 'DHS';
  String security = 'Enabled';
  String display = 'High Contrast';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _currentIndex == 0
                ? 'Home'
                : _currentIndex == 1
                    ? 'Settings'
                    : _currentIndex == 2
                        ? 'RFM LOYALTY'
                        : _currentIndex == 3
                            ? 'Alert'
                            : 'Sign Out',
          ),
        ),
        body: _buildBody(),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.black,
          color: Color.fromARGB(255, 19, 19, 19),
          items: <Widget>[
            FaIcon(
              FontAwesomeIcons.home,
              size: 25,
              color: _currentIndex == 0
                  ? Colors.white
                  : Color.fromARGB(255, 255, 255, 255),
            ),
            FaIcon(
              FontAwesomeIcons.cogs,
              size: 25,
              color: _currentIndex == 1
                  ? Colors.white
                  : const Color.fromARGB(255, 255, 255, 255),
            ),
            FaIcon(
              FontAwesomeIcons.dollarSign,
              size: 25,
              color: _currentIndex == 2
                  ? Colors.white
                  : const Color.fromARGB(255, 255, 255, 255),
            ),
            FaIcon(
              FontAwesomeIcons.bell,
              size: 25,
              color: _currentIndex == 3
                  ? Colors.white
                  : const Color.fromARGB(255, 255, 255, 255),
            ),
            FaIcon(
              FontAwesomeIcons.signOutAlt,
              size: 25,
              color: _currentIndex == 4
                  ? Colors.white
                  : const Color.fromARGB(255, 255, 255, 255),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });

            // Handle navigation based on the selected index
            switch (index) {
              case 0:
                // Navigate to Home
                break;
              case 1:
                // Navigate to Settings
                break;
              case 2:
                // Navigate to Transactions
                break;
              case 3:
                // Navigate to Alert
                break;
              case 4:
                // Navigate to Sign Out
                break;
            }
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_currentIndex == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/pos_terminal.png',
              width: 350,
              height: 350,
            ),
            /*Text(
              'Welcome!',
              style: TextStyle(fontSize: 25),
            ),*/
            SizedBox(height: 16.0),
          ],
        ),
      );
    } else if (_currentIndex == 1) {
      return ListView(
        children: [
          _buildSettingTile(
            title: 'Language',
            subtitle: language,
            icon: Icons.language,
            onTap: () {
              _showLanguageDialog();
            },
          ),
          _buildSettingTile(
            title: 'Theme',
            subtitle: theme,
            icon: Icons.palette,
            onTap: () {
              _showThemeDialog();
            },
          ),
          _buildSettingTile(
            title: 'Notifications',
            subtitle: notifications,
            icon: Icons.notifications,
            onTap: () {
              _showNotificationsDialog();
            },
          ),
          _buildSettingTile(
            title: 'Currency',
            subtitle: currency,
            icon: Icons.attach_money,
            onTap: () {
              _showCurrencyDialog();
            },
          ),
          _buildSettingTile(
            title: 'Security',
            subtitle: security,
            icon: Icons.security,
            onTap: () {
              _showSecurityDialog();
            },
          ),
          _buildSettingTile(
            title: 'Display',
            subtitle: display,
            icon: Icons.desktop_windows,
            onTap: () {
              _showDisplayDialog();
            },
          ),
        ],
      );
    } else if (_currentIndex == 2) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('MID: $mid', style: TextStyle(fontSize: 18)),
                SizedBox(width: 16.0),
                Text('TID: $tid', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 16.0),
            Text(' $version', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TransactionsPage()),
                );
              },
              child: Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 26, 26, 26),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.dollarSign,
                      size: 50,
                      color: Colors.white,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Transactions',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else if (_currentIndex == 3) {
      return _buildAlertTab();
    } else if (_currentIndex == 4) {
      return _buildSignOutTab();
    } else {
      return Center(
        child: Text('This is the home page'),
      );
    }
  }

  ListTile _buildSettingTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(icon),
      onTap: onTap,
    );
  }

  Widget _buildAlertTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'lib/assets/img2.png',
            width: window.physicalSize.width / window.devicePixelRatio * 0.5,
            height: window.physicalSize.height / window.devicePixelRatio * 0.3,
          ),
          SizedBox(height: 16.0),
          Text(
            'No Alerts, No Notifications',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget _buildSignOutTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'lib/assets/img3.png',
            width: 400,
            height: 300,
            color: Color.fromRGBO(255, 255, 255,
                0.8), // Adjust the alpha value (last parameter) for transparency
            colorBlendMode: BlendMode.modulate,
          ),
          ElevatedButton(
            onPressed: () {
              // Perform sign-out logic here
            },
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 26, 26, 26),
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Sign Out',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String selectedLanguage = language;
        return AlertDialog(
          title: Text('Language Settings'),
          content: Column(
            children: [
              Text('Choose your preferred language:'),
              _buildRadioOption('English', selectedLanguage, 'English'),
              _buildRadioOption('Arabic', selectedLanguage, 'Arabic'),
              _buildRadioOption('French', selectedLanguage, 'French'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  language = selectedLanguage;
                });
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRadioOption(
      String label, String currentSelection, String optionValue) {
    return ListTile(
      title: Text(label),
      leading: Radio(
        value: optionValue,
        groupValue: currentSelection,
        onChanged: (String? value) {
          /* selectedLanguage = value!;*/
        },
      ),
    );
  }

  void _showThemeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String selectedTheme = theme;
        return AlertDialog(
          title: Text('Theme Settings'),
          content: Column(
            children: [
              Text('Choose your preferred theme:'),
              _buildRadioOption('Light', selectedTheme, 'Light'),
              _buildRadioOption('Dark', selectedTheme, 'Dark'),
              _buildRadioOption(
                  'System Default', selectedTheme, 'System Default'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  theme = selectedTheme;
                });
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showNotificationsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String selectedNotifications = notifications;
        return AlertDialog(
          title: Text('Notifications Settings'),
          content: Column(
            children: [
              Text('Toggle notifications:'),
              _buildRadioOption('On', selectedNotifications, 'On'),
              _buildRadioOption('Off', selectedNotifications, 'Off'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  notifications = selectedNotifications;
                });
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showCurrencyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String selectedCurrency = currency;
        return AlertDialog(
          title: Text('Currency Settings'),
          content: Column(
            children: [
              Text('Choose your preferred currency:'),
              _buildRadioOption('DHS', selectedCurrency, 'DHS'),
              _buildRadioOption('EUR', selectedCurrency, 'EUR'),
              _buildRadioOption('USD', selectedCurrency, 'USD'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  currency = selectedCurrency;
                });
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSecurityDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String selectedSecurity = security;
        return AlertDialog(
          title: Text('Security Settings'),
          content: Column(
            children: [
              Text('Toggle security features:'),
              _buildRadioOption('Enabled', selectedSecurity, 'Enabled'),
              _buildRadioOption('Disabled', selectedSecurity, 'Disabled'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  security = selectedSecurity;
                });
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showDisplayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String selectedDisplay = display;
        return AlertDialog(
          title: Text('Display Settings'),
          content: Column(
            children: [
              Text('Choose your preferred display settings:'),
              _buildRadioOption(
                  'High Contrast', selectedDisplay, 'High Contrast'),
              _buildRadioOption('Normal', selectedDisplay, 'Normal'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  display = selectedDisplay;
                });
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
