// import 'package:flutter/material.dart';
// import 'package:flutter_blue/flutter_blue.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   FlutterBlue flutterBlue = FlutterBlue.instance;
//   bool isDeviceFound = false;

//   @override
//   void initState() {
//     super.initState();
//     _checkPairedDevices();
//   }

//   void _checkPairedDevices() async {
//     flutterBlue.startScan(timeout: Duration(seconds: 4));

//     flutterBlue.scanResults.listen((results) {
//       for (ScanResult r in results) {
//         if (r.device.name.contains('Neuro')) {
//           setState(() {
//             isDeviceFound = true;
//           });
//           flutterBlue.stopScan();
//           _navigateToDevicePage();
//           break;
//         }
//       }
//     });

//     await Future.delayed(Duration(seconds: 4));
//     if (!isDeviceFound) {
//       _showNoDevicesDialog();
//     }
//   }

//   void _navigateToDevicePage() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => NeuroDevicesPage()),
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
//               _checkPairedDevices();
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

// class NeuroDevicesPage extends StatefulWidget {
//   @override
//   _NeuroDevicesPageState createState() => _NeuroDevicesPageState();
// }

// class _NeuroDevicesPageState extends State<NeuroDevicesPage> {
//   bool isNeuroDevice = false;

//   @override
//   void initState() {
//     super.initState();
//     _checkIfNeuroDevice();
//   }

//   void _checkIfNeuroDevice() {
//     setState(() {
//       isNeuroDevice = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Neuro Hub'),
//           bottom: TabBar(
//             tabs: [
//               Tab(text: 'Devices'),
//               Tab(text: 'Search/Pair'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             DevicesTab(isNeuroDevice: isNeuroDevice),
//             SearchPairTab(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DevicesTab extends StatelessWidget {
//   final bool isNeuroDevice;

//   DevicesTab({required this.isNeuroDevice});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 3,
//       padding: EdgeInsets.all(16.0),
//       mainAxisSpacing: 16.0,
//       crossAxisSpacing: 16.0,
//       children: [
//         if (isNeuroDevice) // Only show Neuro-specific devices if it's a Neuro device
//           DeviceTile(
//             icon: Icons.watch,
//             title: 'NeuroWatch',
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => NeuroWatchPage()),
//               );
//             },
//           ),
//         if (isNeuroDevice)
//           DeviceTile(
//             icon: Icons.tablet,
//             title: 'NeuroTab',
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => NeuroTabPage()),
//               );
//             },
//           ),
//         if (isNeuroDevice)
//           DeviceTile(
//             icon: Icons.headset,
//             title: 'NeuroSight',
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => NeuroSightPage()),
//               );
//             },
//           ),
//         if (isNeuroDevice)
//           DeviceTile(
//             icon: Icons.camera_alt,
//             title: 'NeuroLens',
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => NeuroLensPage()),
//               );
//             },
//           ),
//         if (isNeuroDevice)
//           DeviceTile(
//             icon: Icons.ring_volume,
//             title: 'NeuroRing',
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => NeuroRingPage()),
//               );
//             },
//           ),
//         if (isNeuroDevice)
//           DeviceTile(
//             icon: Icons.headphones,
//             title: 'NeuroBuds',
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => NeuroBudsPage()),
//               );
//             },
//           ),
//       ],
//     );
//   }
// }

// class SearchPairTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Search and Pair Devices'),
//     );
//   }
// }

// class DeviceTile extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final VoidCallback onTap;

//   DeviceTile({required this.icon, required this.title, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 50),
//           SizedBox(height: 10),
//           Text(title),
//         ],
//       ),
//     );
//   }
// }

// class NeuroWatchPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('NeuroWatch'),
//       ),
//       body: Center(
//         child: Text('NeuroWatch details here'),
//       ),
//     );
//   }
// }

// // Similar pages for NeuroTabPage, NeuroSightPage, NeuroLensPage, NeuroRingPage, NeuroBudsPage

// class NeuroTabPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('NeuroTab'),
//       ),
//       body: Center(
//         child: Text('NeuroTab details here'),
//       ),
//     );
//   }
// }

// class NeuroSightPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('NeuroSight'),
//       ),
//       body: Center(
//         child: Text('NeuroSight details here'),
//       ),
//     );
//   }
// }

// class NeuroLensPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('NeuroLens'),
//       ),
//       body: Center(
//         child: Text('NeuroLens details here'),
//       ),
//     );
//   }
// }

// class NeuroRingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('NeuroRing'),
//       ),
//       body: Center(
//         child: Text('NeuroRing details here'),
//       ),
//     );
//   }
// }

// class NeuroBudsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('NeuroBuds'),
//       ),
//       body: Center(
//         child: Text('NeuroBuds details here'),
//       ),
//     );
//   }
// }




// //=================================================================================================================







// class NeuroDevicesPage extends StatefulWidget {
//   @override
//   _NeuroDevicesPageState createState() => _NeuroDevicesPageState();
// }

// class _NeuroDevicesPageState extends State<NeuroDevicesPage> {
//   FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
//   bool isNeuroDevice = false; // Flag to track if it's a Neuro device

//   @override
//   void initState() {
//     super.initState();
//     _startScanning();
//   }

//   void _startScanning() async {
//     // Start scanning for devices
//     flutterBlue.startScan(timeout: Duration(seconds: 4));

//     // Listen for scan results
//     flutterBlue.scanResults.listen((results) {
//       for (ScanResult r in results) {
//         // Check if the device is a Neuro device based on manufacturer data
//         if (_isNeuroDevice(r.advertisementData.manufacturerData)) {
//           setState(() {
//             isNeuroDevice = true;
//           });
//           flutterBlue.stopScan();
//           break; // Stop scanning once a Neuro device is found
//         }
//       }
//     });

//     // Stop scanning after 4 seconds if no Neuro device is found
//     await Future.delayed(Duration(seconds: 4));
//     if (!isNeuroDevice) {
//       flutterBlue.stopScan();
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Neuro Devices'),
//       ),
//       body: Center(
//         child: isNeuroDevice
//             ? Text('Neuro device found!')
//             : Text('No Neuro devices found.'),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: NeuroDevicesPage(),
//     );
//   }
// }
