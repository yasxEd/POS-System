import 'package:flutter/material.dart';

class SystemInfoPage extends StatelessWidget {
  // Actual dummy data for device information
  final String dummyDeviceModel = 'Alcatel AE82';
  final String dummyOs = 'Android';
  final String dummyOsVersion = 'Android 11';
  final String dummyLocale = 'en_MA';
  final String dummyDeviceName = 'TPE';
  final String dummyDeviceType = 'POS TERMINAL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('System Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildInfoItem('Device Model', dummyDeviceModel),
            buildDivider(),
            SizedBox(height: 15.0),
            buildInfoItem('Operating System', dummyOs),
            buildDivider(),
            SizedBox(height: 15.0),
            buildInfoItem('OS Version', dummyOsVersion),
            buildDivider(),
            SizedBox(height: 15.0),
            buildInfoItem('Local Locale', dummyLocale),
            buildDivider(),
            SizedBox(height: 15.0),
            buildInfoItem('Device Name', dummyDeviceName),
            buildDivider(),
            SizedBox(height: 15.0),
            buildInfoItem('Device Type', dummyDeviceType),
            // Add more dummy system information as needed
          ],
        ),
      ),
    );
  }

  Widget buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(height: 15.0),
        Text(value),
      ],
    );
  }

  Widget buildDivider() {
    return Divider(
      color: const Color.fromARGB(255, 52, 52, 52),
      height: 20,
      thickness: 0.5,
      indent: 20,
      endIndent: 20,
    );
  }
}
