import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget reviewSuccessImage(){
  return Stack(
    children: [
      SvgPicture.asset('assets/images/img_review_success.svg'),
      Positioned(
        top: 22,
        left: 22,
        child: SvgPicture.asset('assets/images/img_right_sign.svg'),
      ),
    ],
  );
}