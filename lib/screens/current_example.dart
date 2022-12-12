import 'package:flutter/material.dart';


import 'package:geolocator/geolocator.dart';

import 'package:geocoding/geocoding.dart';

class Homepage extends StatefulWidget {

    const Homepage({Key? key}) : super(key: key);


    @override

    _HomepageState createState() => _HomepageState();

}   


class _HomepageState extends State {


    String location ='Null, Press Button';

    String Address = 'search';


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

        Placemark place = placemarks[0];

        Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

        setState(()  {

        });

    }


    @override

    Widget build(BuildContext context) {

        return Scaffold(

            appBar: AppBar(

                title: const Text('Get Current Address'),

            ),

            body: Center(

                child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                        Text('Coordinates Points',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),

                        SizedBox(height: 10,),

                        Text(location,style: TextStyle(color: Colors.black,fontSize: 16),),

                        SizedBox(height: 10,),

                        Text('Current Address',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),

                        SizedBox(height: 10,),

                        Text('${Address}'),

                        ElevatedButton(onPressed: () async{

                            Position position = await _getGeoLocationPosition();

                            location ='Latitude: ${position.latitude} , Longitude: ${position.longitude}';

                            GetAddressFromLatLong(position);

                        }, child: Text('Get Current Location'))

                    ],

                ),

            ),

        );

    }

}