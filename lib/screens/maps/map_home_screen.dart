import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider_app/utils/drawer/custom_drawer.dart';
import 'package:rider_app/utils/form_field_utils/size_utils.dart';

class MapHomeScreen extends StatefulWidget {
  const MapHomeScreen({super.key});

  @override
  State<MapHomeScreen> createState() => _MapHomeScreenState();
}

class _MapHomeScreenState extends State<MapHomeScreen> {
  GoogleMapController? mapController;
  CameraPosition? cameraPosition;
  LatLng startLocation = const LatLng(27.6602292, 85.308027);

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
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          GoogleMap(
            zoomGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
              target: startLocation,
              zoom: 14.0,
            ),
            mapType: MapType.normal,
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
                padding: EdgeInsets.only(top: getVerticalSize(50), left: getHorizontalSize(16),),
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
