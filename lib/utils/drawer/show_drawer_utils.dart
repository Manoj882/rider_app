import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/utils/form_field_utils/size_utils.dart';

showDrawer(){
  
  return Builder(
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        top: getVerticalSize(50),
        left: getHorizontalSize(16),
      ),
      child: Container(
        // margin: const EdgeInsets.all(8),
        padding: getPadding(all: 10),
        height: getVerticalSize(45),
        width: getHorizontalSize(45),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(getVerticalSize(50)),
        ),
        child: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: SvgPicture.asset(
            'assets/images/img_menu.svg',
          ),
        ),
      ),
    ),
  );
}