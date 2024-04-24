import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Fun extends StatefulWidget {
  @override
  _FunState createState() => _FunState();
}

class _FunState extends State<Fun> {
  String quote = '';

  Future<void> fetchQuote() async {
    final response = await http.get(Uri.parse("https://zenquotes.io/api/random"));
    final json_data = jsonDecode(response.body);
    setState(() {
      quote = json_data[0]["q"] + " -" + json_data[0]["a"];
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
              onPressed: () {
                fetchQuote();
              },
              child: Text('New Quote'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Fun(),
  ));
}


// TODO: add wifi detection