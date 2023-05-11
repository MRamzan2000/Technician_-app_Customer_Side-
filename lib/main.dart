import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_customer_side/Map/map.dart';
import 'package:technician_customer_side/Meesages/Messages/Messages.dart';
import 'package:technician_customer_side/Starting%20Pages/First_page.dart';

import 'Bottom bar/Bottom_Bar.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String myid = "";

  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      myid = prefs.getString("id") ?? "";
    });
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    // Messages()
    //MapSample()
    myid == ""  ?  First_Page()  : Bottom_Bar()
    );
  }
}
