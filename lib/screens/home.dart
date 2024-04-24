import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(52.609341, -2.142479);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
      
      child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            Container(
              padding: EdgeInsets.only(top: 50.0),
              child: SizedBox(
                  
                width: 300.0,
                height: 250.0,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "Welcome to Robert Rodeo!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                
              ),

            ),
            Text(
              "The best place to find the best rides and have the most fun!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                
              ),
            ),

            Text(
              "About Us:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                
              ),
            ),

            Text(
              "Welcome to Robert’s Rodeo, where the excitement never ends! Nestled near Wolverhampton, our theme park offers a thrilling blend of exhilarating rides and enchanting themed gardens, providing fun and entertainment for the whole family. Whether you're seeking adrenaline-pumping adventures on our roller coasters or a serene stroll through our meticulously crafted gardens, there's something for everyone at Robert’s Rodeo. Come and experience the magic for yourself!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                
              ),
            ),

            Text(
              "We are located at:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                
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




    
          ]


        ),
      )
      );

    
  }
}