import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider_app/utils/drawer/drawer_page.dart';
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

  

  //function for changing the custom image (marker icon in map)
  // Future<Uint8List> getBytesFromAsset(
  //     {required String path, required int width}) async {
  //   final data = await rootBundle.load(path);
  //   final codec = await ui.instantiateImageCodec(
  //     data.buffer.asUint8List(),
  //     targetWidth: width,
  //   );
  //   final frameInfo = await codec.getNextFrame();
  //   return (await frameInfo.image.toByteData(format: ui.ImageByteFormat.png))!
  //       .buffer
  //       .asUint8List();

    
  // }

  // Future<Uint8List> getCustomMarker() async {
  //   final customMarker = await getBytesFromAsset(
  //     path: 'assets/images/img_source.svg',
  //     width: 50,
  //   );
  //   return customMarker;
  // }


  
  // //other approach
  // Set<Marker> markers = Set(); //markers for google map
  // addMarkers() async {
  //    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
  //         ImageConfiguration(
  //           size: Size(10, 10),
            
  //         ),
  //         "assets/images/bike.jpg",
  //    );

  //     markers.add(
  //       Marker( //add start location marker
  //         markerId: MarkerId('Source'),
  //         position: startLocation, //position of marker
  //         infoWindow: InfoWindow( //popup info 
  //           title: 'Starting Point ',
  //           snippet: 'Start Marker',
  //         ),
  //         icon: markerbitmap, //Icon for Marker
  //       )
  //     );
  // }

  // @override
  // void initState() {
  //   addMarkers();
  //   super.initState();
  // }

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
            // markers: markers,
            markers: {
              Marker(
                markerId: MarkerId('soruce'),
                position: startLocation,
                infoWindow: InfoWindow(title: 'Start Location'),
                
              ),
              Marker(
                markerId: MarkerId('destination'),
                position: destination,
                infoWindow: InfoWindow(title: 'Your Destination'),
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
            child: Builder(
              builder: (context) => Padding(
                padding: EdgeInsets.only(
                  top: getVerticalSize(50),
                  left: getHorizontalSize(16),
                ),
                child: Container(
                  // margin: const EdgeInsets.all(8),
                  padding: getPadding(all: 10),
                  height: getVerticalSize(45),
                  width: getHorizontalSize(45),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(getVerticalSize(50)),
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: SvgPicture.asset(
                      'assets/images/img_menu.svg',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

