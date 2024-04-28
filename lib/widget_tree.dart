import 'package:flutter/material.dart';
import 'package:roberts_rodeo/app_body.dart';
import 'package:roberts_rodeo/auth.dart';
import 'package:roberts_rodeo/screens/login_register.dart';

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