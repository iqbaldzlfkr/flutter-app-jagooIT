import 'package:flutter/material.dart';
import 'package:flutter_app/pages/calculator_page.dart';
import 'package:flutter_app/pages/dummy_first_page.dart';
import 'package:flutter_app/pages/dummy_second_page.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/input_validation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/dummy-first': (context) => const DummyFirstPage(),
        '/dummy-second': (context) => const DummySecondPage(),
        '/calculator': (context) => const CalculatorPage(),
        '/input-validation': (context) => const InputValidationPage(),
      },
    );
  }
}
