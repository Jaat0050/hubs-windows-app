// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plugin/flutter_blue_plugin.dart';
// import 'package:neuro_hub/view/home_screen.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   bool isDeviceFound = false;
//   FlutterBlue flutterBlue = FlutterBlue.instance;

//   @override
//   void initState() {
//     super.initState();
//     _startScanning();
//   }

//   Future<void> _startScanning() async {
//     // Start scanning for devices
//     flutterBlue.startScan(timeout: Duration(seconds: 4));

//     // Listen for scan results
//     flutterBlue.scanResults.listen((results) {
//       for (ScanResult r in results) {
//         // Check if the device is a Neuro device based on name or manufacturer data
//         if (r.device.name.contains('Neuro') ||
//             _isNeuroDevice(r.advertisementData.manufacturerData)) {
//           setState(() {
//             isDeviceFound = true;
//           });
//           flutterBlue.stopScan();
//           _navigateToDevicePage();
//           break; // Stop scanning once a Neuro device is found
//         }
//       }
//     });

//     // Stop scanning after 4 seconds if no Neuro device is found
//     await Future.delayed(Duration(seconds: 4));
//     if (!isDeviceFound) {
//       flutterBlue.stopScan();
//       _showNoDevicesDialog();
//     }
//   }

//   bool _isNeuroDevice(Map<int, List<int>>? manufacturerData) {
//     if (manufacturerData != null && manufacturerData.isNotEmpty) {
//       // Replace the manufacturer ID and pattern bytes with the actual values for Neuro devices
//       // Example: Manufacturer ID for Neuro devices
//       const int manufacturerId = 0xFFFF; // Placeholder value

//       // Example: Pattern bytes to identify Neuro devices (e.g., "Neuro" in ASCII)
//       const List<int> pattern = [0x4E, 0x65, 0x75, 0x72, 0x6F];

//       // Check if manufacturer ID matches
//       if (manufacturerData.containsKey(manufacturerId)) {
//         // Check if pattern bytes match
//         List<int> data = manufacturerData[manufacturerId]!;
//         if (data.length >= pattern.length) {
//           for (int i = 0; i <= data.length - pattern.length; i++) {
//             bool match = true;
//             for (int j = 0; j < pattern.length; j++) {
//               if (data[i + j] != pattern[j]) {
//                 match = false;
//                 break;
//               }
//             }
//             if (match) {
//               return true;
//             }
//           }
//         }
//       }
//     }
//     return false;
//   }

//   void _navigateToDevicePage() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => HomeScreen()),
//     );
//   }

//   void _showNoDevicesDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('No Devices Found'),
//         content: Text('Please pair a Neuro device to continue.'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               _startScanning();
//             },
//             child: Text('Retry'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
