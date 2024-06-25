import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/rides.dart';
import 'screens/fun.dart';
import 'screens/user_info.dart';
import 'screens/food_and_drink.dart';

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
        title: Text(
          "ParkBite",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        
      ),
      body: IndexedStack(
        
        index: _selectedIndex,
        children: <Widget>[ 
          Home(),
          Rides(),
          FunTab(),
          FoodAndDrink(),
          UserInfo()
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
            icon: Icon(Icons.fastfood),
            label: "Food & Drink",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.onPrimaryContainer,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}