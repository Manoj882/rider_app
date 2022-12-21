import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/constants/strings_constant.dart';
import 'package:rider_app/home/home_screen.dart';
import 'package:rider_app/screens/reviews/my_reviews_page.dart';
import 'package:rider_app/screens/trips/all_trip_page.dart';
import 'package:rider_app/screens/dashboard/dashboard_page.dart';
import 'package:rider_app/screens/documents/vehicle_details.dart';
import 'package:rider_app/utils/divider/custom_divider.dart';
import 'package:rider_app/utils/listtile/custom_list_tile.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';
import 'package:rider_app/utils/sliver_appbar/general_sliver_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({required this.userType, super.key});

  final String userType;

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          GeneralSliverAppBar(appBarTitle: StringsConstant.menu),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(20),
                    right: getHorizontalSize(20),
                  ),
                  children: [
                    Container(
                      height: 140,
                      child: DrawerHeader(
                        padding: getPadding(all: 0),
                        child: Row(
                          children: [
                            Container(
                              height: getVerticalSize(78),
                              width: getHorizontalSize(78),
                              child: Stack(
                                children: [
                                  Container(
                                    height: getVerticalSize(70),
                                    width: getHorizontalSize(70),
                                    child: CircleAvatar(
                                      child: Image.asset(
                                          'assets/images/avatar.png'),
                                    ),
                                  ),
                                  Positioned(
                                    left: getVerticalSize(28),
                                    bottom: getVerticalSize(0.5),
                                    child: Container(
                                      height: getVerticalSize(18),
                                      width: getHorizontalSize(18),
                                      padding: getPadding(all: 3),
                                      decoration: BoxDecoration(
                                        color: ColorsConstant.white,
                                        borderRadius: BorderRadius.circular(
                                          getVerticalSize(50),
                                        ),
                                      ),
                                      child: SvgPicture.asset(
                                          'assets/images/img_checkmark.svg'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: getHorizontalSize(10),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: getVerticalSize(18)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Uttam Tamang',
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(4),
                                  ),
                                  Text(
                                    '+977 9851041853',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  Text(
                                    'View Profile',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: ColorsConstant.darkGrey,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //for user
                    if (widget.userType == 'User')
                      Column(
                        children: [
                          CustomListTile().buildListTile(
                            context,
                            title: 'Become a rider',
                            subTitle: 'Edit your profile',
                          ),
                          divider(),
                          CustomListTile().buildListTile(
                            context,
                            title: 'Promos',
                            subTitle: 'View all our promo codes',
                          ),
                          divider(),
                          CustomListTile().buildListTile(
                            context,
                            title: 'Ridewell for Business',
                            subTitle: 'Change your Wallet PIN',
                          ),
                        ],
                      ),

                    //for rider
                    if (widget.userType == 'Rider')
                      Column(
                        children: [
                          CustomListTile().buildListTile(
                            context,
                            title: 'Rider History',
                            subTitle: 'View everything about the ride you did',
                            widget: AllTripPage(),
                          ),
                          divider(),
                          CustomListTile().buildListTile(
                            context,
                            title: 'Dashboard',
                            subTitle:
                                'View all your information and insights at one place',
                            widget: DashboardPage(),
                          ),
                          divider(),
                          CustomListTile().buildListTile(
                            context,
                            title: 'My Documents',
                            subTitle: 'View all your documents',
                            widget: VehicleDetailsPage(),
                          ),
                          divider(),
                          CustomListTile().buildListTile(
                            context,
                            title: 'My Reviews',
                            subTitle: 'Check all the reviews user gave',
                            widget: MyReviewsPage(),
                          ),
                          divider(),
                          CustomListTile().buildListTile(
                            context,
                            title: 'Saved Address',
                            subTitle: 'View all your saved address',
                            
                          ),
                        ],
                      ),

                    widget.userType == 'User'
                    ? SizedBox(
                      height: getVerticalSize(60),
                    )
                    : const SizedBox.shrink(),

                    divider(),
                    CustomListTile().customListTile(
                      context,
                      leading:
                          SvgPicture.asset('assets/images/img_permission.svg'),
                      title: 'Permissions',
                    ),
                    CustomListTile().customListTile(
                      context,
                      leading: SvgPicture.asset('assets/images/img_terms.svg'),
                      title: 'Terms & Conditions',
                    ),
                    CustomListTile().customListTile(
                      context,
                      leading:
                          SvgPicture.asset('assets/images/img_headset.svg'),
                      title: 'Support',
                    ),
                    CustomListTile().customListTile(
                      context,
                      leading: SvgPicture.asset('assets/images/img_logout.svg'),
                      title: 'Logout',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
