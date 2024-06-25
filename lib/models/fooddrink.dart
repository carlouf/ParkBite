class FoodAndDrinkItem {
  final String name;
  final String location;
  final String image;
  final String description;
  final String availability;
  final String price;

  FoodAndDrinkItem({
    required this.name,
    required this.location,
    required this.image,
    required this.description,
    required this.availability,
    required this.price,
  });

  factory FoodAndDrinkItem.fromJson(Map<String, dynamic> json) {
    return FoodAndDrinkItem(
      name: json['name'],
      location: json['location'],
      image: json['image'],
      description: json['description'],
      availability: json['availability'],
      price: json['price'],
    );
  }
}
