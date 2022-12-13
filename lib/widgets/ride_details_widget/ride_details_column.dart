import 'package:flutter/material.dart';
class RideDetailsColumn{
  buildRideDetails(BuildContext context, String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
    );
  }
}