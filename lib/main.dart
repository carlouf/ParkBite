import 'package:flutter/material.dart';
import 'app_body.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Robert Rodeo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppBody(),

    );
  }
}














