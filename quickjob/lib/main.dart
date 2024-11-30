import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quickjob/screens/landing_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(primaryColor: Colors.green),
      home: const LandingPage(),
    );
  }
}
