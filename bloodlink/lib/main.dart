import 'package:bloodlink/login.dart';
import 'package:bloodlink/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BloodLink());
}

class BloodLink extends StatelessWidget {
  const BloodLink({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
