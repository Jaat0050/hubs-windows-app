import 'package:flutter/material.dart';

class DeviceDetailsScreen extends StatefulWidget {
  String title;

  DeviceDetailsScreen({super.key, required this.title});

  @override
  State<DeviceDetailsScreen> createState() => _DeviceDetailsScreenState();
}

class _DeviceDetailsScreenState extends State<DeviceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} Details', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.06),
            Text(
              '${widget.title} features:',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.grey.shade100),
            ),
            SizedBox(height: size.height * 0.08),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Wrap(
                spacing: 50,
                runSpacing: 50,
                alignment: WrapAlignment.center,
                children: [
                  buttonBuilderWidget('Seamless File Syncing and Backup:'),
                  buttonBuilderWidget('Extended Display and Screen Mirroring:'),
                  buttonBuilderWidget('Enhanced Security Features:'),
                  buttonBuilderWidget('Collaborative Features:'),
                  buttonBuilderWidget('Media and Entertainment:'),
                  buttonBuilderWidget('Productivity Tools:'),
                  buttonBuilderWidget('Customizable User Profiles:'),
                  buttonBuilderWidget('Performance Boost and Resource Sharing:'),
                  buttonBuilderWidget('Unified User Interface:'),
                  buttonBuilderWidget('Advanced Connectivity and IoT Integration:'),
                  buttonBuilderWidget('Development and Testing Environment:'),
                  buttonBuilderWidget('Power Management:'),
                  buttonBuilderWidget('Enhanced Audio and Voice Commands:'),
                  buttonBuilderWidget('Gaming and AR/VR Integration:'),
                ],
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget buttonBuilderWidget(String title) {
    Size size = MediaQuery.of(context).size;

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.grey.shade700),
        elevation: MaterialStatePropertyAll(4),
        fixedSize: MaterialStatePropertyAll(Size(size.width * 0.28, size.height * 0.11)),
      ),
      onPressed: () {
        _connectWithDevices(context);
      },
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 21)),
    );
  }

  void _connectWithDevices(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Connect with Other Devices'),
          content: Text('Connecting with other devices...'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
