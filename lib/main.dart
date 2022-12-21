import 'package:flutter/material.dart';
import 'package:rider_app/constants/routes_constant.dart';
import 'package:rider_app/home/home_screen.dart';
import 'package:rider_app/pagination_example.dart';
import 'package:rider_app/screens/payment_user/user_side_page.dart';
import 'package:rider_app/screens/riders/trip_request_page.dart';
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
      // home: MapHomeScreen(userType: 'User',),
      home: HomeScreen(),
     
      // home: TripRequestPage(),
      // home: UserSidePage(),

      // home: HomePage(),

      
      
    );
  }
}

