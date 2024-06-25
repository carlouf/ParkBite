import 'package:flutter/material.dart';
import 'package:ParkBite/models/fooddrink.dart';
import 'package:ParkBite/screens/loadFoodAndDrinkData.dart';

class FoodAndDrink extends StatefulWidget {
  const FoodAndDrink({super.key});

  @override
  _FoodAndDrinkState createState() => _FoodAndDrinkState();
}

class _FoodAndDrinkState extends State<FoodAndDrink> {
  late Future<List<FoodAndDrinkItem>> _foodAndDrinkItems;

  @override
  void initState() {
    super.initState();
    _foodAndDrinkItems = loadFoodAndDrinkData();
  }

  Future<void> moreInfo(FoodAndDrinkItem item, BuildContext context, bool isOnline) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(item.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Location: ${item.location}"),
              Image.asset(
                item.image,
                fit: BoxFit.cover,
              ),
              Text("Description: ${item.description}"),
              Text("Availability: ${item.availability}"),
              Text("Price: ${item.price}"),  // Add this line
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food & Drink"),
      ),
      body: FutureBuilder<List<FoodAndDrinkItem>>(
        future: _foodAndDrinkItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            final items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  leading: Image.asset(
                    item.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.name),
                  subtitle: Text('${item.location}\nPrice: ${item.price}'),  // Add this line
                  onTap: () => moreInfo(item, context, false),
                );
              },
            );
          }
        },
      ),
    );
  }
}
