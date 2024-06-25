import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'dart:convert';
import 'package:ParkBite/models/ride.dart';
import 'package:flutter/services.dart' show rootBundle;

class Rides extends StatefulWidget {
  const Rides({super.key});

  Future<void> moreInfo(Ride ride, BuildContext context, bool isOnline) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(ride.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
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
            ),
          ],
        );
      },
    );
  }

  @override
  State<Rides> createState() => _RidesState();
}

class _RidesState extends State<Rides> {
  late StreamSubscription subscription;
  bool isOnline = false;

  @override
  void initState() {
    super.initState();
    getConnectivity();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
              (List<ConnectivityResult> results) async {
            isOnline = await InternetConnectionChecker().hasConnection;
          }
          );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rides"),
      ),
      body: isOnline ? const Online() : const Offline(),
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}

class Online extends StatefulWidget {
  const Online({super.key});

  @override
  State<Online> createState() => _OnlineState();
}

class _OnlineState extends State<Online> {
  late List<Ride> rides = [];

  @override
  void initState() {
    super.initState();
    fetchRides();
  }

  Future<void> fetchRides() async {
    final response = await http.get(Uri.parse('https://birtch.zapto.org/roberts_rodeo/rides.json'));
    if (response.statusCode == 200) {
      setState(() {
        Map<String, dynamic> data = jsonDecode(response.body);
        rides = (data['rides'] as List).map((json) => Ride.fromJson(json)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return rides.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
      itemCount: rides.length,
      itemBuilder: (context, index) {
        final ride = rides[index];
        return ListTile(
          leading: Image.network(
            ride.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(ride.name),
          subtitle: Text("Location: ${ride.location}\nWait Time: ${ride.waitTime}"),
          onTap: () => Rides().moreInfo(ride, context, true),
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
  late List<Ride> rides = [];

  @override
  void initState() {
    super.initState();
    fetchRides();
  }

  Future<void> fetchRides() async {
    final String jsonData = await rootBundle.loadString('assets/rides.json');
    setState(() {
      rides = (json.decode(jsonData)['rides'] as List).map((json) => Ride.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return rides.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
      itemCount: rides.length,
      itemBuilder: (context, index) {
        final ride = rides[index];
        return ListTile(
          leading: Image.asset(
            ride.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(ride.name),
          subtitle: Text("Location: ${ride.location}\nWait Time: ${ride.waitTime}"),
          onTap: () => Rides().moreInfo(ride, context, false),
        );
      },
    );
  }
}
