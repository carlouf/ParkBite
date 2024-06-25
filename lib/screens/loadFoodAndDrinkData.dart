import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/fooddrink.dart';  // Adjust the path if necessary

Future<List<FoodAndDrinkItem>> loadFoodAndDrinkData() async {
  final String response = await rootBundle.loadString('assets/food_and_drink.json');
  final List<dynamic> data = json.decode(response);
  return data.map((item) => FoodAndDrinkItem.fromJson(item)).toList();
}
