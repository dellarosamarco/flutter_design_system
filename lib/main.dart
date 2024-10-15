import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

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
        body: Column(
          children: [
            CustomCard(title: 'test'),
          ],
        )
      )
    );
  }
}