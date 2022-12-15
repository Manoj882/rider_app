import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';

class ReviewSuccessColumn extends StatelessWidget {
  const ReviewSuccessColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            SvgPicture.asset('assets/images/img_review_success.svg'),
            Positioned(
              top: 22,
              left: 22,
              child: SvgPicture.asset('assets/images/img_right_sign.svg'),
            ),
          ],
        ),
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
