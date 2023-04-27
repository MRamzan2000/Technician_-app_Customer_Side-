import 'package:flutter/material.dart';
import 'package:technician_customer_side/Map/map.dart';
import 'package:technician_customer_side/Meesages/Messages/Messages.dart';
import 'package:technician_customer_side/Starting%20Pages/First_page.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    // Messages()
    // MapSample()
    First_Page()
    );
  }
}
