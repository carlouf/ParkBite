import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roberts_rodeo/auth.dart';
class UserInfo extends StatelessWidget {
  UserInfo({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title(){
    return const Text("User Info");
  }

  Widget _userEmail(){
    return Text("Email: ${user?.email}");
  }

  Widget _signOutButton(){
    return ElevatedButton(
      onPressed: signOut,
      child: const Text("Sign Out"),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _title(),
            _userEmail(),
            _signOutButton(),
          ],
        ),
      ),
    );
  }
}