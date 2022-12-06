import 'package:flutter/material.dart';
import 'package:rider_app/constants/font_constant.dart';

TextStyle _getTextStyle({
  required String fontFamily,
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
}) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

//bold style
TextStyle getBoldStyle({
  double fontSize = FontSize.size16,
  required Color color,
}) {
  return _getTextStyle(
    fontFamily: FontConstant.fontFamily,
    fontSize: fontSize,
    fontWeight: FontWeightConstant.bold,
    color: color,
  );
}

//regular bold style
TextStyle getRegularBoldStyle({
  double fontSize = FontSize.size14,
  required Color color,
}) {
  return _getTextStyle(
    fontFamily: FontConstant.fontFamily,
    fontSize: fontSize,
    fontWeight: FontWeightConstant.bold,
    color: color,
  );
}

//regular style
TextStyle getRegularStyle({
  double fontSize = FontSize.size14,
  required Color color,
}) {
  return _getTextStyle(
    fontFamily: FontConstant.fontFamily,
    fontSize: fontSize,
    fontWeight: FontWeightConstant.regular,
    color: color,
  );
}
