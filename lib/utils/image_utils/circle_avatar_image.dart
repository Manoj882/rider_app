import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';

class CircleAvatarImage extends StatelessWidget {
  const CircleAvatarImage({
    required this.avatarImage,
    super.key});

  final String avatarImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorsConstant.primary,
      radius: getVerticalSize(33),
      child: CircleAvatar(
        radius: getVerticalSize(30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              getVerticalSize(50)),
          child: Image.asset(
            avatarImage,
          ),
        ),
      ),
    );
  }
}