import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  GoogleMapController? mapController;
  CameraPosition? cameraPosition;
  LatLng startLocation = const LatLng(27.7288, 85.3592);
  LatLng destination = const LatLng(27.7061, 85.3148);
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
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
    );
  }
}