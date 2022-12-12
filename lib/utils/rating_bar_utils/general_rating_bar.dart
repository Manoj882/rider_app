import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/models/trip_model.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';


class GeneralRatingBar extends StatefulWidget {
  GeneralRatingBar({
    required this.rating,
    super.key});

  double? rating;


  @override
  State<GeneralRatingBar> createState() => _GeneralRatingBarState();
}

class _GeneralRatingBarState extends State<GeneralRatingBar> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RatingBar.builder(
        initialRating: widget.rating!,
        minRating: 1,
        itemCount: 5,
        unratedColor: Colors.grey.shade200,
        itemSize: getSize(30),
        allowHalfRating: true,
        glow: false,
        direction: Axis.horizontal,
        itemBuilder: (context, _) {
          return Icon(
            Icons.star,
            color: ColorsConstant.starColor,
          );
        },
        onRatingUpdate: (rating) {
          setState(() {
            widget.rating = rating;
            print('rating: ${widget.rating}');
          });
        },
      ),
    );
  }
}