import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ParkBite/auth.dart';

class UserInfo extends StatelessWidget {
  UserInfo({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return Text(
      "Profile",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _userEmail() {
    return Text(
      "Email: ${user?.email}",
      style: TextStyle(
        fontSize: 18,
      ),
    );
  }

  Widget _signOutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: signOut,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.error,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        textStyle: TextStyle(fontSize: 16),
      ),
      child: Text(
        "Sign Out",
        style: TextStyle(color: Theme.of(context).colorScheme.onError),
      ),
    );
  }

  Widget _userAvatar() {
    return CircleAvatar(
      radius: 50,
      backgroundImage: user?.photoURL != null
          ? NetworkImage(user!.photoURL!)
          : AssetImage('assets/images/default_avatar.png') as ImageProvider,
    );
  }

  Widget _userInfoCard() {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _userAvatar(),
            SizedBox(height: 20),
            _userEmail(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _userInfoCard(),
            SizedBox(height: 20),
            _signOutButton(context),
          ],
        ),
      ),
    );
  }
}
