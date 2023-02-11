import 'package:flutter/material.dart';
import 'package:medcare_admin/screens/dashbord.dart';
import 'package:medcare_admin/screens/desk_screen.dart';
import 'package:medcare_admin/screens/doctor_screen.dart';
import 'package:medcare_admin/screens/home.dart';
import 'package:medcare_admin/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
