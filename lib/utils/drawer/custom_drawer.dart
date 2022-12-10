import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/screens/trips/all_trip_page.dart';
import 'package:rider_app/screens/dashboard/dashboard_page.dart';
import 'package:rider_app/screens/documents/vehicle_details.dart';
import 'package:rider_app/utils/divider/custom_divider.dart';
import 'package:rider_app/utils/listtile/custom_list_tile.dart';
import 'package:rider_app/utils/form_field_utils/size_utils.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(
          left: getHorizontalSize(20),
          right: getHorizontalSize(20),
        ),
        children: [
          Padding(
            padding: EdgeInsets.only(top: getVerticalSize(80),),
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
                            child: Image.asset('assets/images/avatar.png'),
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
                              borderRadius: BorderRadius.circular(getVerticalSize(50),),
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
                    padding: EdgeInsets.only(top: getVerticalSize(55)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Uttam Tamang',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(
                          height: getVerticalSize(4),
                        ),
                        Text(
                          '+977 9851041853',
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        Text(
                          'View Profile',
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
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
            subTitle: 'View all your information and insights at one place',
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
            title: 'Saved Address',
            subTitle: 'View all your saved address',
          ),
        ],
      ),
    );
  }
}
