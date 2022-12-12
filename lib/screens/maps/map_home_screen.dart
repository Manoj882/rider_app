import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rider_app/utils/drawer/drawer_page.dart';
import 'package:rider_app/utils/drawer/show_drawer_utils.dart';
import 'package:rider_app/utils/form_field_utils/size_utils.dart';

//for map marker
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;
import 'dart:typed_data';

class MapHomeScreen extends StatefulWidget {
  const MapHomeScreen({super.key});

  @override
  State<MapHomeScreen> createState() => _MapHomeScreenState();
}

class _MapHomeScreenState extends State<MapHomeScreen> {
  GoogleMapController? mapController;
  CameraPosition? cameraPosition;
  LatLng startLocation = const LatLng(27.7288, 85.3592);
  LatLng destination = const LatLng(27.7061, 85.3148);

  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      drawer: const DrawerPage(),
      body: Stack(
        children: [
          GoogleMap(
                  mapType: MapType.normal,
                  zoomGesturesEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: startLocation,
                    zoom: 13.5,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId(startLocation.toString()),
                      position: startLocation,
                      infoWindow: const InfoWindow(
                        title: 'Start Location',
                        snippet: 'Start Point',
                      ),
                    ),
                    Marker(
                      markerId: MarkerId(destination.toString()),
                      position: destination,
                      infoWindow: const InfoWindow(
                        title: 'Your Destination',
                        snippet: 'End Point',
                      ),
                    ),
                  },
                  onMapCreated: (controller) {
                    setState(() {
                      mapController = controller;
                    });
                  },
                ),
          Positioned(
            top: getVerticalSize(10),
            child: showDrawer(),
          ),
        ],
      ),
    );
  }
}
