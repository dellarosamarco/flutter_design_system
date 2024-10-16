import 'package:flutter/material.dart';
import 'tests/custom_card.test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Context.mergeContext(const PartialContext(
    //   primaryColor: Colors.black
    // ));

    return const MaterialApp(
      home: Scaffold(
        body: CustomCardTest()
      )
    );
  }
}