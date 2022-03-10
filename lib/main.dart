import 'package:flutter/material.dart';
import 'package:wppb_flutter/main_screen.dart';

void main(List<String> arguments) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WPPB Flutter',
      theme: ThemeData(fontFamily: "Inter"),
      home: const MainScreen(),
    );
  }
}