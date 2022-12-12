import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/screens/search_destination/search_destination_screen.dart';
import 'package:rider_app/utils/divider/custom_divider.dart';
import 'package:rider_app/utils/listtile/custom_list_tile.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';

class PickupPointScreen extends StatefulWidget {
  PickupPointScreen({required this.address, super.key});

  final String address;

  @override
  State<PickupPointScreen> createState() => _PickupPointScreenState();
}

class _PickupPointScreenState extends State<PickupPointScreen> {
  bool _isClickSearch = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Going Somewhere, Uttam?',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ColorsConstant.darkGrey),
          ),
        ),
        SizedBox(
          height: getVerticalSize(30),
        ),

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
              widget.address,
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
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SearchDestinationScreen(
                  address: widget.address,
                ),
              ),
            );
          },
          child: AbsorbPointer(
            child: Container(
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
                    child: SvgPicture.asset(
                        'assets/images/img_location_24X24.svg'),
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
          ),
        ),
        SizedBox(
          height: getVerticalSize(20),
        ),
        Text(
          'Saved',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorsConstant.darkGrey),
        ),
        SizedBox(
          height: getVerticalSize(10),
        ),
        CustomListTile().customListTile(
          context,
          leading: SvgPicture.asset('assets/images/img_home.svg'),
          title: 'Home',
          subTitle: 'Khadkagaun, Kalanki',
        ),
        divider(),
        CustomListTile().customListTile(context,
            leading: SvgPicture.asset('assets/images/img_television.svg'),
            title: 'Office',
            subTitle: 'Chakhupath, Pulchowk'),
        divider(),
        CustomListTile().customListTile(
          context,
          leading: SvgPicture.asset(
            'assets/images/img_my_location.svg',
            color: ColorsConstant.primary,
            height: 25,
            width: 25,
          ),
          title: 'Set on map',
          trailingWidget:
              SvgPicture.asset('assets/images/img_tileRightArrow.svg'),
        ),
        Text(
          'Add missing place',
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
        CustomListTile().customListTile(
          context,
          leading: SvgPicture.asset('assets/images/img_location_24X24.svg'),
          title: 'Help paywell serve more',
          trailingWidget:
              SvgPicture.asset('assets/images/img_tileRightArrow.svg'),
        ),
      ],
    );
  }
}
