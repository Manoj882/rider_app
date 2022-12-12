import 'package:flutter/material.dart';
import 'package:rider_app/constants/routes_constant.dart';
import 'package:rider_app/home/home_screen.dart';
import 'package:rider_app/screens/current_example.dart';
import '/screens/maps/map_home_screen.dart';
import 'screens/trips/all_trip_page.dart';
import 'screens/dashboard/dashboard_page.dart';
import '/screens/reviews/my_reviews_page.dart';
import 'screens/documents/vehicle_details.dart';
import 'screens/registration/ride_registration_page.dart';
import 'utils/theme/app_theme.dart';

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
      onGenerateRoute: RouteGenerator().getRoute,
      initialRoute: Routes.homeRoute,
      // home: RiderRegistrationPage(),
      // home: AllTripPage(),
      // home: DashboardPage(),
      // home: VehicleDetailsPage(),
      // home: MyReviewsPage(),
      // home: MapHomeScreen(),
      // home: HomeScreen(),
      // home: Homepage(),
      
    );
  }
}

