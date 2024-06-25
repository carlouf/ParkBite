import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(34.665442, 135.432338); // Coordinates for Osaka, Japan (where Super Nintendo World is located)

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(top: 50.0),
              height: 250.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    isDarkMode
                        ? 'assets/images/super_nintendo_world_dark.jpg'
                        : 'assets/images/super_nintendo_world_dark.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "Welcome to Super Nintendo World!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.red, // Nintendo red color
              ),
            ),
            Text(
              "Where adventure awaits and fun never ends!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                color: Colors.blue, // Nintendo blue color
              ),
            ),
            Text(
              "About Us:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.red, // Nintendo red color
              ),
            ),
            Text(
              "Step into the world of Nintendo where your favorite characters come to life! Super Nintendo World in Osaka, Japan offers thrilling rides, interactive experiences, and delicious treats inspired by your beloved video games. It's a place where imagination meets reality!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                color: isDarkMode ? Colors.white : Colors.black, // Adjusted for theme visibility
              ),
            ),
            Text(
              "We are located at:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.red, // Nintendo red color
              ),
            ),
            SizedBox(
              height: 200.0,
              width: 200.0,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 13.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              color: Colors.red, // Domino's Pizza red color
              child: Column(
                children: [
                  Text(
                    "Order Domino's Pizza for Delivery!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Enjoy delicious pizza delivered right to your doorstep while you play!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for ordering pizza
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red, backgroundColor: Colors.white, // Domino's Pizza red color
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    ),
                    child: Text(
                      "Order Now",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red, // Domino's Pizza red color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
