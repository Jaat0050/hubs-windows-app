import 'package:flutter/material.dart';
import 'package:neuro_hub/utils/color.dart';
import 'package:neuro_hub/view/splash_screen.dart';
import 'view/home_screen.dart'; // Assuming NeuroDevicesPage is in a separate file

void main() {
  runApp(NeuroHubApp());
}

class NeuroHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neuro Hub',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
              .copyWith(secondary: Colors.black),
          fontFamily: 'Roboto',
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black87,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          scaffoldBackgroundColor: backgroundColor),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delayed navigation to NeuroDevicesPage after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Add a loading indicator
      ),
    );
  }
}
