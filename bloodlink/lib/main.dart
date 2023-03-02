import 'package:bloodlink/account.dart';
import 'package:bloodlink/home.dart';
import 'package:bloodlink/login.dart';
import 'package:bloodlink/register.dart';
import 'package:bloodlink/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BloodLink());
}

class BloodLink extends StatelessWidget {
  const BloodLink({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegisterSecond(),
      routes: {
        '/login': (context) => Login(),
      },
    );
  }
}
