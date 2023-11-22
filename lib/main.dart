import 'package:flutter/material.dart';
import 'package:learner/main_view.dart';
import 'package:learner/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StudentProfile(),
    );
  }
}
