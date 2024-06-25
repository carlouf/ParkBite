import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ParkBite/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage;
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text(
      "ParkBite Login",
      style: TextStyle(
        fontFamily: 'Mario',
        fontSize: 32,
        color: Colors.white,
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.black,
            offset: Offset(3.0, 3.0),
          ),
        ],
      ),
    );
  }

  Widget _emailField(
      String title,
      TextEditingController controller,
      ) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(color: Colors.yellowAccent),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
      ),
    );
  }

  Widget _passwordField(
      String title,
      TextEditingController controller,
      ) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(color: Colors.yellowAccent),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
      ),
      obscureText: true,
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage ?? "",
      style: TextStyle(color: Colors.redAccent, fontSize: 14),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.redAccent,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        textStyle: TextStyle(fontSize: 18, fontFamily: 'Mario'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(isLogin ? "Login" : "Register"),
    );
  }

  Widget _switchButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.yellowAccent,
        textStyle: TextStyle(fontSize: 16, fontFamily: 'Mario'),
      ),
      child: Text(isLogin ? "Create an account" : "Already have an account?"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/super_nintendo_world_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay to dim the background
          Container(
            color: Colors.black.withOpacity(0.4), // Adjust opacity as needed
            width: double.infinity,
            height: double.infinity,
          ),
          // Content
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _emailField("Email", _controllerEmail),
                SizedBox(height: 16),
                _passwordField("Password", _controllerPassword),
                SizedBox(height: 16),
                _errorMessage(),
                SizedBox(height: 16),
                _submitButton(),
                SizedBox(height: 16),
                _switchButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
