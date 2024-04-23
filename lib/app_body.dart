import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/rides.dart';
import 'screens/fun.dart';
import 'screens/screen4.dart';

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Robert Rodeo"),
        backgroundColor: Color.fromRGBO(217, 187, 99, 1),
      ),
      body: IndexedStack(
        
        index: _selectedIndex,
        children: <Widget>[ 
          Home(),
          Rides(),
          Fun(),
          Screen4(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(217, 187, 99, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: "Rides",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Fun",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.holiday_village),
            label: "Screen 4",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(217, 187, 99, 1),
        unselectedItemColor: Colors.grey[100],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}