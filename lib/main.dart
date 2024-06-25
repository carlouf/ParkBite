import 'package:flutter/material.dart';
import 'package:ParkBite/theme/dark_theme.dart';
import 'package:ParkBite/theme/light_theme.dart';
import 'package:ParkBite/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
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
      title: "ParkBite",
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: const WidgetTree(),
    );
  }
}
