import 'package:flutter/material.dart';
import 'package:medcare_admin/screens/home.dart';
import 'package:medcare_admin/screens/issued_tokens_screen.dart';
import 'package:medcare_admin/screens/login.dart';
import 'package:medcare_admin/screens/patient_details_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://nrkcnsvzixpxysgqcrfd.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5ya2Nuc3Z6aXhweHlzZ3FjcmZkIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NzA1ODYxOSwiZXhwIjoxOTkyNjM0NjE5fQ.rDYJRGbNlap2HwCqGU9pWkOlJmBa2eMK_-r8o0YRU5U',
  );

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
        inputDecorationTheme: ThemeData.light().inputDecorationTheme.copyWith(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
      ),
      home: const Login(),
    );
  }
}

// TODO: Add revenue and salary section if required