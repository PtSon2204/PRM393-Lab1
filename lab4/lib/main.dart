import 'package:flutter/material.dart';
import 'package:prm393_lab4/exercise1/exercise1.dart';
import 'package:prm393_lab4/exercise2/exercise2.dart';
import 'package:prm393_lab4/exercise3/exercise3.dart';
import 'package:prm393_lab4/exercise4/exercise4.dart';
import 'package:prm393_lab4/exercise5/exercise5.dart';

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
      home: const Exercise5(),
    );
  }
}
