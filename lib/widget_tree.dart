import 'package:flutter/material.dart';
import 'package:ParkBite/app_body.dart';
import 'package:ParkBite/auth.dart';
import 'package:ParkBite/screens/login_register.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) => snapshot.hasData
          ? const AppBody()
          : const LoginPage(),
    );
  }
}