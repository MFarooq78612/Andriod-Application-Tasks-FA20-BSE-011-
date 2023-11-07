// --------PROFILE 1------------------------


import 'package:flutter/material.dart';
import 'profile2.dart';
import 'profile1.dart';
import 'profile3.dart';
import 'profile4.dart';
import 'profile5.dart';
import 'profile6.dart';
import 'profile8.dart';
import 'profile9.dart';
import 'profile10.dart';

// import 'package:flutter/scheduler.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/pf10',
      routes: {
        '/pf1': (context) => Profile1(), // Define the initial route
        '/pf2': (context) => Profile2(), // Define additional routes
        '/pf3': (context) => Profile3(), // Define additional routes
        '/pf4': (context) => Profile4(), // Define additional routes
        '/pf5': (context) => Profile5(), // Define additional routes       
        '/pf6': (context) => Profile6(), // Define additional routes             
        '/pf8': (context) => Profile8(), // Define additional routes
        '/pf9': (context) => Profile9(), // Define additional routes
        '/pf10': (context) => Profile10(), // Define additional routes
      },
    );
  }
}




