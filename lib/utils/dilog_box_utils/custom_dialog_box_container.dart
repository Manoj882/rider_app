import 'package:flutter/material.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';

class CustomDialogBoxContainer extends StatelessWidget {
  const CustomDialogBoxContainer({
    required this.widget,
    required this.height,
    required this.width,
    super.key});

  final Widget widget;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(getVerticalSize(30),),
          ),
          child: Container(
          // height: getVerticalSize(354),
          // width: getHorizontalSize(374),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(getVerticalSize(30)),
          ),
          child: Padding(
            padding: getPadding(all: 25),
            child: widget,
          ),
        ),
    );
  }
}