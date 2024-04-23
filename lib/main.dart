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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          background:Color(0xFF3D3028),
          brightness: Brightness.dark
        ),
      ),
      home: const AppBody(),

    );
  }
}



 









