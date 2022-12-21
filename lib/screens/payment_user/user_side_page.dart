import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/models/trip_model.dart';
import 'package:rider_app/screens/payment_user/feedback_on_rider.dart';
import 'package:rider_app/screens/payment_user/payment_successful_report.dart';
import 'package:rider_app/screens/payment_user/review_success_column.dart';
import 'package:rider_app/screens/payment_user/rider_found_column.dart';
import 'package:rider_app/screens/payment_user/trip_completed_body.dart';
import 'package:rider_app/screens/payment_user/verify_pin_column.dart';
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

  bool isPaymentDone = false;
  bool isPinVerified = false;

  bool isPaymentSuccessfulDone = false;

  @override
  void didChangeDependencies() {
    groupPaymentOption = ModalRoute.of(context)!.settings.arguments as String;
    //  print('hello'+groupPaymentOption);
    super.didChangeDependencies();
  }



  //for fingerprint
  final _localAuthentication = LocalAuthentication();
  String _message = 'Not Authorized';

  Future<bool> checkingForBioMetrics() async {
    bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
    return canCheckBiometrics;
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: 'Verify Pin',
        options: AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true, 
          biometricOnly: true,
        ),
        
       
      );
      if(authenticated){
        setState(() {
        _message = authenticated ? 'Authorized' : 'Not Authrized';
        isPaidViaWallet = !isPaidViaWallet;
      });
      }
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    checkingForBioMetrics();
    super.initState();
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
                              ?  isPaymentSuccessfulDone
                                  ? isReviewSubmitted
                                      ? const ReviewSuccessColumn()
                                      : FeedbackOnRiderColumn(
                                          onPressed: () {
                                            setState(() {
                                              isReviewSubmitted =
                                                  !isReviewSubmitted;
                                            });
                                          },
                                        )
                                  : PaymentSuccessfulReportColumn(
                                      onPressed: () {
                                        setState(() {
                                          isPaymentSuccessfulDone =
                                              !isPaymentSuccessfulDone;
                                        });
                                      },
                                    )
                              :  WalletColumn(
                                      onPressed: () async{
                                        await _authenticate();
                                        // setState(() {
                                        //   isPaidViaWallet = !isPaidViaWallet;
                                        // });
                                      },
                                    )

                          //for other payment method (cash & QR)
                          : isOtherModePaid
                              ? isReviewSubmitted
                                  ? const ReviewSuccessColumn()
                                  : FeedbackOnRiderColumn(
                                      onPressed: () {
                                        setState(() {
                                          isReviewSubmitted =
                                              !isReviewSubmitted;
                                        });
                                      },
                                    )
                              : const RiderFoundColumn(),
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
