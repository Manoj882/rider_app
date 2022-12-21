import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/utils/review_success_image_utils/review_success_image.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';

class ReviewSuccessColumn extends StatelessWidget {
  const ReviewSuccessColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        reviewSuccessImage(),
        SizedBox(
          height: getVerticalSize(28),
        ),
        Text(
          'Review successfully submitted',
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
