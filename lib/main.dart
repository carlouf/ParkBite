import 'package:flutter/material.dart';
import 'package:roberts_rodeo/theme/dark_theme.dart';
import 'package:roberts_rodeo/theme/light_theme.dart';
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
      theme: lightTheme,
      darkTheme: darkTheme,
      
      home: const AppBody(),

    );
  }
}



 









