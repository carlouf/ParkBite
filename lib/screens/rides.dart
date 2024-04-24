import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'dart:convert';
import 'package:roberts_rodeo/models/ride.dart';
import 'package:flutter/services.dart' show rootBundle;





class Rides extends StatefulWidget {
  const Rides({super.key});

  Future<Dialog> moreInfo(Ride ride, BuildContext context, bool isOnline) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
      return AlertDialog(
        title: Text(ride.name),
          content: Column(
            children: [
              Text("Location: ${ride.location}"),

            if (isOnline)
              Image.network(
                ride.image,
                fit: BoxFit.cover,
              )
            else
              Image.asset(
                ride.image,
                fit: BoxFit.cover,
              ),

              Text("Description: ${ride.description}"),
              Text("Wait Time: ${ride.waitTime}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            )
          ],
      );
    
    
    }
    
  );
    // Add your code here
  return Future.value(Dialog());
  }    

  @override
  State<Rides> createState() => _RidesState();
}

class _RidesState extends State<Rides> {

  late StreamSubscription subscription;
  bool isOnline = false;
  bool isAlertSet = false;


  @override
  void initState() {
    getConnectivity();
    super.initState();
    
  }

  getConnectivity() => 
    subscription = Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> results) async {
        isOnline = await InternetConnectionChecker().hasConnection;
      }
    //https://www.youtube.com/watch?v=PQ2H3DhBb0s
    
    );

  @override
  Widget build(BuildContext context) {
    return isOnline ? const Online() : const Offline();
  }


}












class Online extends StatefulWidget {
  const Online({super.key});

  @override
  State<Online> createState() => _OnlineState();
}

class _OnlineState extends State<Online> {
  late List<Ride> rides = []; // Initialize with an empty list

  @override
  void initState() {
    super.initState();
    fetchRides();
  }

  Future<void> fetchRides() async {
    final response = await http.get(Uri.parse('https://birtch.zapto.org/roberts_rodeo/rides.json'));
    if (response.statusCode == 200) {
      setState((){
        Map<String, dynamic> data = jsonDecode(response.body);
        rides = (data['rides'] as List)
            .map((json) => Ride.fromJson(json))
            .toList();
      });

    }
  }



  



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: rides.length,
            itemBuilder: (context, index) {
              return TextButton(
                onPressed: () {
                  Rides().moreInfo(rides[index], context, true);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 72.0, // Adjust the width of the image container as needed
                      height: 72.0, // Adjust the height of the image container as needed
                      child: SizedBox(
                        width: 72.0, // Adjust the width of the image container as needed
                        height: 72.0,
                        child: Image(
                          image: NetworkImage(rides[index].image),
                          fit: BoxFit.cover,
                        ),
                      )
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(
                        rides[index].name,
                        style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),

                        Text(rides[index].location, style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer,)),
                        Text(rides[index].waitTime, style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer,)),
                      ],
                    )
                  ],
                )
              );
              

            },
            );
              


  }
}


class Offline extends StatefulWidget {
  const Offline({super.key});

  @override
  State<Offline> createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  late List<Ride> rides = []; // Initialize with an empty list

  @override
  void initState() {
    super.initState();
    fetchRides();
  }

  Future<void> fetchRides() async {

    final String jsonData = await rootBundle.loadString('assets/rides.json');
    setState(() {
      rides = (json.decode(jsonData)['rides'] as List)
          .map((json) => Ride.fromJson(json))
          .toList();
    });

  }



  



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: rides.length,
            itemBuilder: (context, index) {
              return TextButton(
                onPressed: () {
                  Rides().moreInfo(rides[index], context, false);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 72.0, // Adjust the width of the image container as needed
                      height: 72.0, // Adjust the height of the image container as needed
                      child: SizedBox(
                        width: 72.0, // Adjust the width of the image container as needed
                        height: 72.0,
                        child: Image(
                          image: AssetImage(rides[index].image),
                          fit: BoxFit.cover,
                        ),
                      )
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(
                        rides[index].name,
                        style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        ),
                      ),

                        Text(rides[index].location),
                        Text(rides[index].waitTime),
                      ],
                    )
                  ],
                )
              );
              

            },
            );
              


  }
}





//image sources;
//https://www.alamy.com/stock-photo-a-young-girl-tries-to-stay-on-the-mechanical-bull-on-a-summer-day-16730478.html
//https://riskavoider.com/stampede-and-crush-hazard/stampede-crush-survival-tips/
//https://www.mentalfloss.com/article/543974/why-do-tumbleweeds-tumble
//https://www.vermontpublic.org/programs/2021-01-29/why-are-cactuses-spiky
//https://www.britannica.com/story/pro-and-con-gold-standard
//https://www.rollingstone.com/tv-movies/tv-movie-reviews/the-real-wild-west-docuseries-dark-bloody-history-how-west-won-1234780801/
//https://education.nationalgeographic.org/resource/prairie/
//https://www.thesun.co.uk/travel/22950173/theme-park-sundown-adventure-tripadvisor-midlands/
//https://www.tripspoint.com/united-arab-emirates/lahbab/tour/private-tours/private-desert-safari-dubai-dune-bashing-camel-ride-sand-surfing/7830
//https://www.explore.com/1538329/if-run-into-rattlesnake-hike-what-need-do-safety/