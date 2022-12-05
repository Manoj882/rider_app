import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/constants/font_constant.dart';
import 'package:rider_app/constants/styles_constant.dart';
import 'package:rider_app/constants/values_constant.dart';

ThemeData getThemeData() {
  return ThemeData(
    primaryColor: ColorsConstant.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsConstant.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.size15),
        ),
        textStyle: getRegularStyle(
          color: ColorsConstant.white,
        ),
      ),
    ),
    textTheme: TextTheme(
      headline1: getRegularStyle(
        color: ColorsConstant.black,
        fontSize: FontSize.size14,
      ),
    ),
  );
}
