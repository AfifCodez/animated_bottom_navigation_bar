import 'package:flutter/material.dart';

import 'landing_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Bottom Navigation Bar',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        accentColor: Colors.black,
      ),
      home: LandingScreen(),
    );
  }
}
