import 'package:flutter/material.dart';
import 'package:roberts_rodeo/theme/dark_theme.dart';
import 'package:roberts_rodeo/theme/light_theme.dart';
import 'app_body.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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



 









