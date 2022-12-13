import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/screens/search_destination/pickup_point_screen.dart';
import 'package:rider_app/utils/divider/custom_divider.dart';
import 'package:rider_app/utils/drawer/drawer_page.dart';
import 'package:rider_app/utils/drawer/show_leading_icon_utils.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

//for map marker
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:rider_app/utils/listtile/custom_list_tile.dart';
import 'package:rider_app/widgets/container_widget/curved_buttom_container.dart';
import 'package:rider_app/widgets/google_map_widget/custom_google_map.dart';

class MapHomeScreen extends StatefulWidget {
  MapHomeScreen({super.key});

  

  @override
  State<MapHomeScreen> createState() => _MapHomeScreenState();
}

class _MapHomeScreenState extends State<MapHomeScreen> {
  // GoogleMapController? mapController;
  // CameraPosition? cameraPosition;
  // LatLng startLocation = const LatLng(27.7288, 85.3592);
  // LatLng destination = const LatLng(27.7061, 85.3148);

  final _searchController = TextEditingController();

  bool isClickSearch = false;

  String location ='';

    String currentAddress = 'search';


    Future _getGeoLocationPosition() async {
        bool serviceEnabled;
        LocationPermission permission;
        // Test if location services are enabled.
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
            await Geolocator.openLocationSettings();
            return Future.error('Location services are disabled.');
        }

        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
            if (permission == LocationPermission.denied) {
                // your App should show an explanatory UI now.
                return Future.error('Location permissions are denied');
            }
        }

        if (permission == LocationPermission.deniedForever) {
            // Permissions are denied forever, handle appropriately.
            return Future.error(
                'Location permissions are permanently denied, we cannot request permissions.');
        }

        // When we reach here, permissions are granted and we can
        // continue accessing the position of the device.
        return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    }


    Future GetAddressFromLatLong(Position position)async {
        List placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
        print(placemarks);
        Placemark place = placemarks[1];
        currentAddress = '${place.thoroughfare},${place.subLocality}, ${place.locality}';
        setState(()  {

        });

    }

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
          CustomGoogleMap(),

          //for drawer
          Positioned(
            top: getVerticalSize(10),
            child: showLeadingIcon(
              leadingIcon: 'assets/images/img_menu.svg', 
              onPressed: (){
              Scaffold.of(context).openDrawer();
            }),
          ),

          //for container
          Align(
            alignment: Alignment.bottomCenter,
            child: CurvedButtomContainer(
              widget: Padding(
                padding:
                    const EdgeInsets.only(top: 30, right: 30, left: 30, bottom: 10),
                child: isClickSearch 
                ? PickupPointScreen(address: currentAddress,)
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Going Somewhere, Uttam?',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: ColorsConstant.darkGrey),
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(30),
                    ),


                    //search destination
                    GestureDetector(
                      onTap: () async{
                        Position position = await _getGeoLocationPosition();
                        location ='Latitude: ${position.latitude} , Longitude: ${position.longitude}';
                        GetAddressFromLatLong(position);
                        setState(() {
                          isClickSearch = true;
                          
                        });
                      },
                      child: AbsorbPointer(
                        child: Container(
                          height: getVerticalSize(60),
                          
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            controller: _searchController,
                            textAlignVertical: TextAlignVertical.center,
                            readOnly: true,
                            decoration: InputDecoration(
                              prefixIconConstraints: const BoxConstraints(
                                minHeight: 25,
                                minWidth: 25,
                              ),
                              contentPadding: const EdgeInsets.all(20),
                              prefixIcon: Container(
                                padding: EdgeInsets.only(
                                  top: getVerticalSize(19),
                                  bottom: getVerticalSize(19),
                                  left: getHorizontalSize(18),
                                  right: getHorizontalSize(15),
                                ),
                                child: SvgPicture.asset(
                                    'assets/images/img_location_24X24.svg'),
                              ),
                              hintText: 'Search Destination',
                              hintStyle:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                        color: ColorsConstant.borderColor,
                                      ),
                              suffixIcon: Container(
                                padding: EdgeInsets.only(
                                  top: getVerticalSize(19),
                                  bottom: getVerticalSize(19),
                                  left: getHorizontalSize(18),
                                  right: getHorizontalSize(15),
                                ),
                                child:
                                    SvgPicture.asset('assets/images/img_plus.svg'),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsConstant.borderColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorsConstant.borderColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(20),
                    ),
                    Text(
                      'Saved',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorsConstant.darkGrey),
                    ),
                    SizedBox(
                      height: getVerticalSize(10),
                    ),
                    CustomListTile().customListTile(
                      context,
                      leading: SvgPicture.asset('assets/images/img_home.svg'),
                      title: 'Home',
                      subTitle: 'Khadkagaun, Kalanki',
                    ),
                    divider(),
                    CustomListTile().customListTile(context,
                        leading: SvgPicture.asset(
                            'assets/images/img_television.svg'),
                        title: 'Office',
                        subTitle: 'Chakhupath, Pulchowk'),
                    divider(),
                    CustomListTile().customListTile(context,
                        leading: SvgPicture.asset(
                          'assets/images/img_my_location.svg',
                          color: ColorsConstant.primary,
                          height: 25,
                          width: 25,
                        ),
                        title: 'Set on map',
                        trailingWidget: SvgPicture.asset(
                            'assets/images/img_tileRightArrow.svg')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
