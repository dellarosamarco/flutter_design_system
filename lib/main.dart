import 'package:flutter/material.dart';
import 'package:flutter_design_system/components/calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  DateTime futureDate = DateTime.now().add(const Duration(days: 5));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Calendar(
          initialDate: DateTime.now(),
          lastDate: DateTime.now(),
          onDateChanged: (_) {},
          firstDate: DateTime.now(),
          filledDays: [
            DateTime.now(),
            futureDate
          ],
        )
      )
    );
  }
}