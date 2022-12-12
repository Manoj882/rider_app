import 'package:flutter/material.dart';
import 'package:rider_app/constants/strings_constant.dart';
import 'package:rider_app/home/home_screen.dart';
import 'package:rider_app/models/trip_model.dart';
import 'package:rider_app/screens/dashboard/dashboard_page.dart';
import 'package:rider_app/screens/documents/vehicle_details.dart';
import 'package:rider_app/screens/maps/map_home_screen.dart';
import 'package:rider_app/screens/registration/ride_registration_page.dart';
import 'package:rider_app/screens/reviews/my_reviews_page.dart';
import 'package:rider_app/screens/trips/all_trip_page.dart';
import 'package:rider_app/screens/trips/trip_details_page.dart';
import 'package:rider_app/utils/drawer/drawer_page.dart';

class Routes {
  static const String homeRoute = '/';
  static const String registerRoute = '/register';
  static const String mapRoute = '/initialMap';
  static const String allTripsRoute = '/allTrips';
  static const String tripDetailsRoute = '/tripDetails';
  static const String reviewsRoute = '/reviews';
  static const String documentsRoute = '/documents';
  static const String drawerRoute = '/drawer';
  static const String dashboardRoute = '/dashboard';
}

class RouteGenerator {
  late TripModel tripModel;
  Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RiderRegistrationPage());
      case Routes.mapRoute:
        return MaterialPageRoute(builder: (_) => MapHomeScreen());
      case Routes.allTripsRoute:
        return MaterialPageRoute(builder: (_) => const AllTripPage());
      case Routes.tripDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => TripDetailsPage(model: tripModel),
        );
      case Routes.reviewsRoute:
        return MaterialPageRoute(builder: (_) => const MyReviewsPage());
      case Routes.documentsRoute:
        return MaterialPageRoute(builder: (_) => const VehicleDetailsPage());
      case Routes.drawerRoute:
        return MaterialPageRoute(builder: (_) => const DrawerPage());
      case Routes.dashboardRoute:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(StringsConstant.noRouteFound),
        ),
        body: const Center(
          child: Text(StringsConstant.noRouteFound),
        ),
      ),
    );
  }
}
