import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/utils/image_utils/circle_avatar_image.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';

class TripCompletedBody extends StatelessWidget {
  const TripCompletedBody({
    required this.paymentMethodMode,
    super.key});

  final String paymentMethodMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your Trip is completed',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(
                color: ColorsConstant.black,
              ),
        ),
        SizedBox(
          height: getVerticalSize(25),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatarImage(
                avatarImage: 'assets/images/avatar.png'),
            SizedBox(
              width: getHorizontalSize(15),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Uttam Tamage',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(
                          color: ColorsConstant.black,
                        ),
                  ),
                  SizedBox(
                    height: getVerticalSize(13),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildDetailsColumn(
                        context,
                        title: 'Total Distance',
                        value: '24.06 km',
                      ),
                      SizedBox(width: getHorizontalSize(10),),
                      buildDetailsColumn(
                        context,
                        title: 'Fair',
                        value: 'Rs. 149',
                      ),
                      SizedBox(width: getHorizontalSize(15),),
                      buildDetailsColumn(
                        context,
                        title: 'Mode',
                        value: paymentMethodMode,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDetailsColumn(BuildContext context,{required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: ColorsConstant.daysAgoColor,
              ),
        ),
        SizedBox(height: getVerticalSize(5),),
        Text(
          value,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
