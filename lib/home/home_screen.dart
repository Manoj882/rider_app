import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/constants/routes_constant.dart';
import 'package:rider_app/screens/maps/map_home_screen.dart';
import 'package:rider_app/screens/registration/ride_registration_page.dart';
import 'package:rider_app/utils/drawer/drawer_page.dart';
import 'package:rider_app/utils/drawer/show_drawer_utils.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';
import 'package:rider_app/widgets/custom_elevated_button_widget/general_elevated_button.dart';
import 'package:rider_app/widgets/radio_button_widget/custom_radio_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _groupUser;

  ValueChanged<String?> _valueChangedhandler() {
    return (value) {
      setState(() {
        _groupUser = value!;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    print('Selected value: ${_groupUser.toString()}');
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      drawer: const DrawerPage(),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: getVerticalSize(70),
            leading: Builder(builder: (context) {
              return IconButton(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(20),
                  top: getVerticalSize(20),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: SvgPicture.asset(
                  'assets/images/img_menu.svg',
                ),
              );
            }),
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalSize(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(80),
                          bottom: getVerticalSize(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildCardContainer(
                              imagePath: 'assets/images/img_rider.svg',
                              title: 'Rider',
                              groupValue: _groupUser,
                              onChanged: _valueChangedhandler(),
                              value: 'Rider',
                            ),
                            buildCardContainer(
                              imagePath: 'assets/images/img_user.svg',
                              title: 'User',
                              groupValue: _groupUser,
                              onChanged: _valueChangedhandler(),
                              value: 'User',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(330),
                      ),
                      GeneralElevatedButton(
                        onPressed: () {
                          _groupUser == 'Rider'
                              ? Navigator.pushNamed(context, Routes.registerRoute)
                              : Navigator.pushNamed(context, Routes.mapRoute);
                        },
                        buttonTitle: 'Select',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildCardContainer({
    required String imagePath,
    required String title,
    required String? groupValue,
    required ValueChanged<String?> onChanged,
    required String value,
  }) {
    return Container(
      height: getVerticalSize(169),
      width: getHorizontalSize(170),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          getVerticalSize(10),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.15),
            blurRadius: getVerticalSize(10),
            offset: const Offset(
              0,
              1,
            ),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.15),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ChooseUserOption(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),
            CircleAvatar(
              radius: getVerticalSize(25),
              backgroundColor: const Color.fromRGBO(220, 20, 60, 0.149),
              child: SvgPicture.asset(imagePath),
            ),
            SizedBox(
              height: getVerticalSize(15),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
