import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/models/trip_model.dart';
import 'package:rider_app/utils/image_utils/circle_avatar_image.dart';
import 'package:rider_app/utils/location_to_destination_utils/location_to_destination.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';

import '../../widgets/custom_elevated_button_widget/custom_elevated_button.dart';

class RiderFoundColumn extends StatefulWidget {
  const RiderFoundColumn({super.key});

  @override
  State<RiderFoundColumn> createState() => _RiderFoundColumnState();
}

class _RiderFoundColumnState extends State<RiderFoundColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              'Rider Found',
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(
                    fontSize: 18,
                  ),
            ),
            Spacer(),
            SvgPicture.asset(
                'assets/images/img_user_chat.svg'),
            SizedBox(
              width: getHorizontalSize(26),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 22),
              child: SvgPicture.asset(
                  'assets/images/img_user_phone.svg'),
            ),
          ],
        ),
        SizedBox(
          height: getVerticalSize(22),
        ),
        CircleAvatarImage(
            avatarImage: 'assets/images/avatar.png'),
        SizedBox(
          height: getVerticalSize(10),
        ),
        Text(
          'Uttam Tamang',
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          height: getVerticalSize(5),
        ),
        Text(
          '+977-9812987638',
          style:
              Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: ColorsConstant.black,
                  ),
        ),
        SizedBox(
          height: getVerticalSize(10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                    'assets/images/img_single_star.svg'),
                SizedBox(
                  width: getHorizontalSize(11),
                ),
                Text(
                  '4.50',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                        color: ColorsConstant.black,
                      ),
                ),
              ],
            ),
            Text(
              '1547 Trips',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(
                    color: ColorsConstant.black,
                  ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                    'assets/images/img_blood.svg'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'O +ve',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                        color: ColorsConstant.black,
                        fontSize: 12,
                      ),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset('assets/images/img_pro.svg'),
                SizedBox(
                  width: 10,
                ),
                Text('Professional'),
              ],
            ),
          ],
        ),
        SizedBox(
          height: getVerticalSize(11),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Bike Details',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'Pulsar 220',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              'Ba Pr 02-022 Pa 2601',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
        SizedBox(
          height: getVerticalSize(20),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Trip Details',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        LocationToDestination(model: tripList.first),
        SizedBox(
          height: getVerticalSize(20),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total Distance'),
                Text('24.04 km'),
              ],
            ),
            SizedBox(
              width: getHorizontalSize(15),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fair'),
                Text('Rs. 149'),
              ],
            ),
            Spacer(),
            SizedBox(
              height: 60,
              width: 160,
              child: CustomElevatedButton(
                onPressed: () {},
                buttonTitle: 'Cancel Ride',
                backgroundColor: ColorsConstant.white,
                textColor: ColorsConstant.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}