import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Fun extends StatefulWidget {
  @override
  _FunState createState() => _FunState();
}

class _FunState extends State<Fun> {

  late StreamSubscription subscription;
  bool isOnline = false;


  @override
  void initState() {
    getConnectivity();
    super.initState();
    
  }

  getConnectivity(){
    subscription = Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> results) async {
        isOnline = await InternetConnectionChecker().hasConnection;
      }
    //https://www.youtube.com/watch?v=PQ2H3DhBb0s
    
    );
  }
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
  late StreamSubscription subscription;
  bool isOnline = false;
  bool _isSnackbarActive = false ;

Future<bool> getConnectivity() async {
  bool isOnline = await InternetConnectionChecker().hasConnection;
  return isOnline;
}


  String quote = '';

  Future<void> fetchQuote() async {
    final response = await http.get(Uri.parse("https://zenquotes.io/api/random"));
    final jsonData = jsonDecode(response.body);
    setState(() {
      quote = jsonData[0]["q"] + " -" + jsonData[0]["a"];
    });
  }

  @override
  void initState() {
    fetchQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Random Quote'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              quote,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {

                isOnline = await getConnectivity();

                if (isOnline) {
                  fetchQuote();
                }else if (!_isSnackbarActive) {
                  _isSnackbarActive = true;
                  ScaffoldMessenger.of(context)
                  .showSnackBar(
                    const SnackBar(
                      content: Text('No Internet Connection'),
                    ),
                  )
                  .closed
                  .then((reason) {
                    _isSnackbarActive = false;
                  });
                }
              },
              child: Text('New Quote'),
            ),
          ],
        ),
      ),
    );
  }
}

class Offline extends StatefulWidget {
  const Offline({super.key});

  @override
  State<Offline> createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  double _gyroX = 0.0; 
  double _gyroY = 0.0; 
  double _gyroZ = 0.0;
  var battery = Battery();
  late Timer timer;
  int batteryLevel = 0;


  @override 
  void initState() { 
    super.initState(); 

    listenBatteryLevel();
    // Listen to gyroscope data stream 
    // ignore: deprecated_member_use
    gyroscopeEvents.listen((GyroscopeEvent event) { 
      // https://www.geeksforgeeks.org/flutter-using-gyroscope-sensor/
      setState(() { 
        _gyroX = event.x; 
        _gyroY = event.y; 
        _gyroZ = event.z; 
      }); 
    }); 
    
  } 

  void listenBatteryLevel() {
    updateBatteryLevel();
    timer = Timer.periodic(Duration(seconds: 5), (timer) async => updateBatteryLevel());

  }

  Future updateBatteryLevel() async {
    final batteryLevel = await battery.batteryLevel;
    setState(() {
      this.batteryLevel = batteryLevel;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offline'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You seem to be offline :('),
          Text('while your offline here is some cool info:'),
            Text('Gyroscope Data:'), // Display a label 
            Text('X: $_gyroX'), // Display gyroscope X data 
            Text('Y: $_gyroY'), // Display gyroscope Y data 
            Text('Z: $_gyroZ'), // Display gyroscope Z data
          Text('Battery Level: $batteryLevel'),
        ],
      )
    );
  }
}