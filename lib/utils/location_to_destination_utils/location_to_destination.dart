import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/models/trip_model.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';

class LocationToDestination extends StatefulWidget {
  LocationToDestination(
      {required this.model, super.key});

  final TripModel model;

  @override
  State<LocationToDestination> createState() => _LocationToDestinationState();
}

class _LocationToDestinationState extends State<LocationToDestination> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              padding: getPadding(all: 0),
              alignment: Alignment.bottomLeft,
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/img_location.svg',
              ),
            ),
            Text(
              widget.model.destination,
              
            ),
          ],
        ),
        Row(
          children: [
            Container(
              padding: getPadding(left: 10, top: 3, bottom: 3, right: 0),
              child: SvgPicture.asset(
                'assets/images/img_vector.svg',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              padding: getPadding(all: 0),
              alignment: Alignment.topLeft,
              onPressed: () {},
              icon: SvgPicture.asset('assets/images/img_location_24X24.svg'),
            ),
            Text(widget.model.location),
          ],
        ),
      ],
    );
  }
}
