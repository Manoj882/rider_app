import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/models/trip_model.dart';
import 'package:rider_app/utils/image_utils/circle_avatar_image.dart';
import 'package:rider_app/utils/location_to_destination_utils/location_to_destination.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';
import 'package:rider_app/widgets/container_widget/curved_buttom_container.dart';
import 'package:rider_app/widgets/custom_elevated_button_widget/custom_elevated_button.dart';
import 'package:rider_app/widgets/custom_elevated_button_widget/general_elevated_button.dart';
import 'package:rider_app/widgets/ride_details_widget/ride_details_column.dart';


class CancelOrAcceptTripRequest extends StatefulWidget {
  const CancelOrAcceptTripRequest({super.key});

  @override
  State<CancelOrAcceptTripRequest> createState() =>
      _CancelOrAcceptTripRequestState();
}

class _CancelOrAcceptTripRequestState extends State<CancelOrAcceptTripRequest> {
  @override
  Widget build(BuildContext context) {
    bool isAccepted = true;
    bool isCanceled = false;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              'Waiting at pick point !',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          SizedBox(height: getVerticalSize(11),),
          Center(
            child: CircleAvatarImage(avatarImage: 'assets/images/avatar.png'),
          ),
          SizedBox(
            height: getVerticalSize(15),
          ),
          Center(
            child: Text('Uttam Tamang', style: Theme.of(context).textTheme.headline2,),
          ),
          SizedBox(
            height: getVerticalSize(18),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/img_phone.svg'),
                SizedBox(
                  width: getHorizontalSize(25),
                ),
                SvgPicture.asset('assets/images/img_chat.svg')
              ],
            ),
          ),
          SizedBox(
            height: getVerticalSize(20),
          ),
          Text(
            'Trip details',
            style: Theme.of(context).textTheme.headline2,
          ),
          
          LocationToDestination(model: tripList.first),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RideDetailsColumn()
                  .buildRideDetails(context, 'Total Distance', '24.09 km'),
              RideDetailsColumn().buildRideDetails(context, 'Fare', 'Rs. 159'),
              RideDetailsColumn()
                  .buildRideDetails(context, 'Ride For', 'friend'),
            ],
          ),
          SizedBox(
            height: getVerticalSize(30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomElevatedButton(
                onPressed: () {
                  setState(() {
                    isAccepted = !isAccepted;
                
                  });
                },
                buttonTitle: 'Cancel Ride',
                width: getHorizontalSize(160),
                backgroundColor: ColorsConstant.white,
                textColor: ColorsConstant.primary,
              
              ),
              SizedBox(width: getHorizontalSize(20),),
              CustomElevatedButton(
                onPressed: () {
                  setState(() {
                    isCanceled = !isCanceled;
                  });
                },
                buttonTitle: 'Accept Trip',
                width: getHorizontalSize(160),
                backgroundColor: ColorsConstant.primary,
                textColor: ColorsConstant.white,
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
