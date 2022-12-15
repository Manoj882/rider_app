import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/models/trip_model.dart';
import 'package:rider_app/screens/payments/payment_recieve_option.dart';
import 'package:rider_app/utils/dilog_box_utils/custom_dialog_box_container.dart';
import 'package:rider_app/utils/dim_container_utils/dim_container.dart';
import 'package:rider_app/utils/drawer/show_leading_icon_utils.dart';
import 'package:rider_app/utils/image_utils/circle_avatar_image.dart';
import 'package:rider_app/utils/location_to_destination_utils/location_to_destination.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';
import 'package:rider_app/widgets/container_widget/curved_buttom_container.dart';
import 'package:rider_app/widgets/custom_elevated_button_widget/custom_elevated_button.dart';
import 'package:rider_app/widgets/custom_elevated_button_widget/general_elevated_button.dart';
import 'package:rider_app/widgets/google_map_widget/custom_google_map.dart';
import 'package:rider_app/widgets/ride_details_widget/ride_details_column.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CancelOrAcceptTripRequest extends StatefulWidget {
  const CancelOrAcceptTripRequest({super.key});

  @override
  State<CancelOrAcceptTripRequest> createState() =>
      _CancelOrAcceptTripRequestState();
}

class _CancelOrAcceptTripRequestState extends State<CancelOrAcceptTripRequest> {
  bool isAccepted = false;

  bool isClickedAccept = true;
  bool isClickedCancel = false;

  Timer? countdownTimer;
  Duration countDownDuration = const Duration(seconds: 5);

  bool isTripStarted = false;
  bool isTripCompleted = false;

  bool _isRequestPayment = false;


  String paymentMethod = 'Cash';
  changePaymentMethod(String method){
    setState(() {
      paymentMethod = method;
    });

  }
  

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  SharedPreferences? pref;

  //start timer
  void startTimer() {
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setCountDown(),
    );
  }

  //stop timer
  void stopTimer() {
    setState(() {
      countdownTimer!.cancel();
    });
  }

  void setCountDown() {
    const reduceSecondBy = 1;
    setState(() {
      final seconds = countDownDuration.inSeconds - reduceSecondBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        setState(() {
          isAccepted = !isAccepted;
        });
      } else {
        countDownDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String stringDigits(int n) => n.toString();
    final seconds = stringDigits(countDownDuration.inSeconds.remainder(6));
    return Scaffold(
      body: Stack(
        children: [
          CustomGoogleMap(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // color: Colors.red,
              height: double.maxFinite,
              child: Stack(
                children: [
                  //for back icon
                  Positioned(
                    top: getVerticalSize(10),
                    child: showLeadingIcon(
                      leadingIcon: 'assets/images/img_backArrow.svg',
                      onPressed: () {
                        Navigator.pop(context);
                        stopTimer();
                      },
                    ),
                  ),
                  
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CurvedButtomContainer(
                      widget: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: getVerticalSize(30),
                          horizontal: getHorizontalSize(20),
                        ),
                        child: SingleChildScrollView(


                          //added payment recieve option
                          child: _isRequestPayment 
                          ? PaymentRecieveOption(changePaymentMethod)
                      
                          : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Text(
                                  'Waiting at pick point !',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              SizedBox(
                                height: getVerticalSize(11),
                              ),
                              Center(
                                child: CircleAvatarImage(
                                    avatarImage: 'assets/images/avatar.png'),
                              ),
                              SizedBox(
                                height: getVerticalSize(15),
                              ),
                              Center(
                                child: Text(
                                  'Uttam Tamang',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RideDetailsColumn().buildRideDetails(
                                    context,
                                    'Total Distance',
                                    '24.09 km',
                                  ),
                                  SizedBox(
                                    width: getHorizontalSize(15),
                                  ),
                                  RideDetailsColumn().buildRideDetails(
                                    context,
                                    'Fare',
                                    'Rs. 159',
                                  ),
                                  SizedBox(
                                    width: getHorizontalSize(37),
                                  ),
                                  isAccepted
                                      ? const SizedBox.shrink()
                                      : RideDetailsColumn().buildRideDetails(
                                          context,
                                          'Ride For',
                                          'friend',
                                        ),
                                ],
                              ),
                              SizedBox(
                                height: getVerticalSize(30),
                              ),
                              isAccepted
                                  ? GeneralElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          isTripStarted = !isTripStarted;
                                        });
                                      },
                                      buttonTitle: 'Start Trip',
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomElevatedButton(
                                          onPressed: () {
                                            if (countdownTimer == null ||
                                                countdownTimer!.isActive) {
                                              stopTimer();
                                            }
                                            isClickedCancel = !isClickedCancel;
                                            isClickedAccept = false;
                                          },
                                          buttonTitle: 'Cancel Ride',
                                          width: getHorizontalSize(160),
                                          backgroundColor: isClickedCancel
                                              ? ColorsConstant.primary
                                              : ColorsConstant.white,
                                          textColor: isClickedCancel
                                              ? ColorsConstant.white
                                              : ColorsConstant.primary,
                                        ),
                                        SizedBox(
                                          width: getHorizontalSize(20),
                                        ),
                                        CustomElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              isAccepted = !isAccepted;
                  
                                              isClickedAccept = !isClickedAccept;
                                              isClickedCancel = false;
                                            });
                                            stopTimer();
                                          },
                                          buttonTitle: 'Accept Trip ($seconds)',
                                          width: getHorizontalSize(160),
                                          backgroundColor: isClickedAccept
                                              ? ColorsConstant.primary
                                              : ColorsConstant.white,
                                          textColor: isClickedAccept
                                              ? ColorsConstant.white
                                              : ColorsConstant.primary,
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  isTripStarted ? const DimContainer() : const SizedBox.shrink(),
              
                  //for trip completed dialog box
                  isTripStarted
                    ? Positioned(
                        top: getVerticalSize(260),
                        right: getHorizontalSize(20),
                        left: getHorizontalSize(20),
                        child: _isRequestPayment 
                        ? const SizedBox.shrink()
                        : CustomDialogBoxContainer(
                                height: getVerticalSize(242),
                                width: getHorizontalSize(374),
                                widget: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Trip Completed',
                                      style: Theme.of(context).textTheme.headline2,
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(20),
                                    ),
                                    Text(
                                      'You have successfully reached your destination. Don\'t you forget to collect your trip fare !',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                    SizedBox(
                                      height: getVerticalSize(30),
                                    ),
                                    GeneralElevatedButton(
                                        onPressed: (){
                                          setState(() {
                                            _isRequestPayment = !_isRequestPayment;
                                            isTripStarted = false;
                                          });

                                        },
                                        buttonTitle: 'Request Payment'),
                                  ],
                                ),
                              ),
                      )
                    : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
