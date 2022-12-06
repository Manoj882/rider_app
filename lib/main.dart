import 'package:flutter/material.dart';
import 'package:rider_app/screens/ride_registration_page.dart';
import 'package:rider_app/screens/rider_registration.dart';
import 'package:rider_app/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      // home: const RiderRegistrationScreen(),
      home: RiderRegistrationPage(),
    );
  }
}

