import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';
import 'package:rider_app/utils/sliver_appbar/general_sliver_app_bar.dart';

class SearchDestinationScreen extends StatelessWidget {
  const SearchDestinationScreen({
    required this.address,
    super.key});

  final String address;

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          GeneralSliverAppBar(
            appBarTitle: 'Going Somewhere, Uttam?',
            bottom: PreferredSize(
              preferredSize: Size(
                double.maxFinite,
                170,
              ),
              child: Container(
                padding: EdgeInsets.only(right: 16, left: 16, bottom: 10),
                
                child: getLocation(context),
              ),
            ),
          ),

          //SliverList
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(
                  child: Text('Search Location'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getLocation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        //pickup point
        Container(
          height: getVerticalSize(70),
          decoration: BoxDecoration(
            color: ColorsConstant.tileColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ListTile(
            horizontalTitleGap: 5,
            tileColor: ColorsConstant.tileColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            leading: SvgPicture.asset('assets/images/img_location.svg'),
            title: Text(
              'Pickup point',
              style: TextStyle(
                color: ColorsConstant.borderColor,
                fontWeight: FontWeight.w300,
              ),
            ),
            subtitle: Text(
              address,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
            trailing: SvgPicture.asset('assets/images/img_edit.svg'),
          ),
        ),

        SizedBox(
          height: getVerticalSize(20),
        ),

        //search destination
        Container(
          height: getVerticalSize(70),
          decoration: BoxDecoration(
            color: ColorsConstant.tileColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            readOnly: true,
            decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(
                minHeight: 25,
                minWidth: 25,
              ),
              contentPadding: EdgeInsets.all(20),
              prefixIcon: Container(
                padding: EdgeInsets.only(
                  top: getVerticalSize(19),
                  bottom: getVerticalSize(19),
                  left: getHorizontalSize(18),
                  right: getHorizontalSize(15),
                ),
                child: SvgPicture.asset('assets/images/img_location_24X24.svg'),
              ),
              hintText: 'Search Destination',
              hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: ColorsConstant.borderColor,
                  ),
              suffixIcon: Container(
                padding: EdgeInsets.only(
                  top: getVerticalSize(19),
                  bottom: getVerticalSize(19),
                  left: getHorizontalSize(18),
                  right: getHorizontalSize(15),
                ),
                child: SvgPicture.asset(
                  'assets/images/img_plus.svg',
                  color: ColorsConstant.darkGrey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
