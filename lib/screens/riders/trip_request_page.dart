import 'package:flutter/material.dart';
import 'package:rider_app/models/trip_model.dart';
import 'package:rider_app/screens/registration/ride_registration_page.dart';
import 'package:rider_app/screens/riders/cancel_or_accept_trip_request.dart';
import 'package:rider_app/utils/dilog_box_utils/custom_dialog_box_container.dart';
import 'package:rider_app/utils/dim_container_utils/dim_container.dart';
import 'package:rider_app/utils/drawer/drawer_page.dart';
import 'package:rider_app/utils/drawer/show_leading_icon_utils.dart';
import 'package:rider_app/utils/image_utils/circle_avatar_image.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';

import 'package:rider_app/widgets/container_widget/curved_buttom_container.dart';
import 'package:rider_app/widgets/custom_elevated_button_widget/general_elevated_button.dart';
import 'package:rider_app/widgets/google_map_widget/custom_google_map.dart';
import 'package:rider_app/widgets/ride_details_widget/ride_details_column.dart';

class TripRequestPage extends StatefulWidget {
  const TripRequestPage({
    required this.userType,
    super.key});

  final String userType;

  @override
  State<TripRequestPage> createState() => _TripRequestPageState();
}

class _TripRequestPageState extends State<TripRequestPage> {
  bool isRequested = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(userType: widget.userType,),
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              CustomGoogleMap(),
              Positioned(
                top: getVerticalSize(10),
                child: showLeadingIcon(
                    leadingIcon: 'assets/images/img_menu.svg',
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    }),
              ),

              isRequested 
              ? const DimContainer()
              : const SizedBox.shrink(),

              // for trip request
              isRequested
                  ? Positioned(
                      top: getVerticalSize(200),
                      left: getHorizontalSize(20),
                      right: getHorizontalSize(20),
                      child: CustomDialogBoxContainer(
                        height: getVerticalSize(354),
                        width: getHorizontalSize(374),
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Hey, you got a trip request !',
                              style:
                                  Theme.of(context).textTheme.headline2!.copyWith(
                                        fontSize: 18,
                                      ),
                            ),
                            SizedBox(
                              height: getVerticalSize(20),
                            ),
                            CircleAvatarImage(
                              avatarImage: 'assets/images/avatar.png',
                            ),
                            SizedBox(
                              height: getVerticalSize(15),
                            ),
                            Text(
                              'Uttam Tamang',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(
                              height: getVerticalSize(24),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RideDetailsColumn().buildRideDetails(
                                    context, 'Total Distance', '25.12'),
                                RideDetailsColumn()
                                    .buildRideDetails(context, 'Fair', 'Rs.140'),
                                RideDetailsColumn()
                                    .buildRideDetails(context, 'Ride for', 'self'),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(27),
                            ),
                            GeneralElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isRequested = !isRequested;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CancelOrAcceptTripRequest(),
                                  ),
                                );
                              },
                              buttonTitle: 'View Details',
                            ),
                          ],
                        ),
                      ),
                    )

                  //for no request
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: CurvedButtomContainer(
                        widget: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: getVerticalSize(30),
                            horizontal: getHorizontalSize(20),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Today',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              SizedBox(
                                height: getVerticalSize(10),
                              ),
                              Text(
                                'No Requests yet',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          );
        }
      ),
    );
  }
}
