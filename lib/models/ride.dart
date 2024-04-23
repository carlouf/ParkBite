class Ride {
  final String name;
  final String description;
  final String location;
  final String waitTime;
  final String image;

  Ride({
    required this.name,
    required this.description,
    required this.location,
    required this.waitTime,
    required this.image,
  });

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      name: json['name'],
      description: json['description'],
      location: json['location'],
      waitTime: json['wait_time'],
      image: json['image'],
    );  
  }


}