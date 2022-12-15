import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/models/trip_model.dart';
import 'package:rider_app/screens/payment_user/feedback_on_rider.dart';
import 'package:rider_app/screens/payment_user/review_success_column.dart';
import 'package:rider_app/screens/payment_user/rider_found_column.dart';
import 'package:rider_app/screens/payment_user/trip_completed_body.dart';
import 'package:rider_app/screens/payment_user/wallet_column.dart';
import 'package:rider_app/utils/dilog_box_utils/custom_dialog_box_container.dart';
import 'package:rider_app/utils/dim_container_utils/dim_container.dart';
import 'package:rider_app/utils/drawer/show_leading_icon_utils.dart';
import 'package:rider_app/utils/image_utils/circle_avatar_image.dart';
import 'package:rider_app/utils/location_to_destination_utils/location_to_destination.dart';
import 'package:rider_app/utils/rating_bar_utils/general_rating_bar.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';
import 'package:rider_app/widgets/container_widget/curved_buttom_container.dart';
import 'package:rider_app/widgets/custom_elevated_button_widget/custom_elevated_button.dart';
import 'package:rider_app/widgets/custom_elevated_button_widget/general_elevated_button.dart';
import 'package:rider_app/widgets/google_map_widget/custom_google_map.dart';

class UserSidePage extends StatefulWidget {
  UserSidePage({super.key});

  @override
  State<UserSidePage> createState() => _UserSidePageState();
}

class _UserSidePageState extends State<UserSidePage> {
  TripModel? model;

  bool isPayedOption = true;

  bool isReviewSubmitted = false;

  late String groupPaymentOption;

  bool isWalletSelected = false;

  bool isOtherModePaid = false;

  bool isPaidViaWallet = false;

  @override
  void didChangeDependencies() {
    groupPaymentOption = ModalRoute.of(context)!.settings.arguments as String;
    //  print('hello'+groupPaymentOption);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // print('Payment  value on user side: ${}');

    // print(groupPaymentOption == 'Cash');

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          const CustomGoogleMap(),
          Container(
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  top: getVerticalSize(10),
                  child: showLeadingIcon(
                    leadingIcon: 'assets/images/img_backArrow.svg',
                    onPressed: () {
                      Navigator.pop(context);
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
                      
                      //for wallet payment method
                      child: groupPaymentOption == 'Paywell' && isWalletSelected
                          ? isPaidViaWallet 
                          ? FeedbackOnRiderColumn(onPressed: (){},)
                           : WalletColumn(
                              onPressed: () {
                                setState(() {
                                  isPaidViaWallet = !isPaidViaWallet;
                                });
                              },
                            )
                          
                          //for other payment method (cash & QR)
                          : isOtherModePaid
                              ? isReviewSubmitted
                              ? ReviewSuccessColumn()
                               : FeedbackOnRiderColumn(
                                  onPressed: () {
                                    setState(() {
                                      isReviewSubmitted = !isReviewSubmitted;
                                    });
                                  },
                                )
                              : RiderFoundColumn(),
                    ),
                  ),
                ),
                isPayedOption ? const DimContainer() : const SizedBox.shrink(),
                isPayedOption
                    ? isOtherModePaid
                        ? const SizedBox.shrink()
                        : Positioned(
                            top: getVerticalSize(250),
                            left: getHorizontalSize(15),
                            right: getHorizontalSize(15),
                            child: CustomDialogBoxContainer(
                              height: getVerticalSize(260),
                              width: double.maxFinite,
                              widget: Column(
                                children: [
                                  TripCompletedBody(
                                      paymentMethodMode: groupPaymentOption),
                                  SizedBox(
                                    height: getVerticalSize(30),
                                  ),
                                  GeneralElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        isOtherModePaid = !isOtherModePaid;
                                        isWalletSelected = !isWalletSelected;
                                        isPayedOption = false;
                                      });
                                    },
                                    buttonTitle: groupPaymentOption == 'QR'
                                        ? 'Complete Status'
                                        : 'Pay',
                                  ),
                                ],
                              ),
                            ),
                          )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
