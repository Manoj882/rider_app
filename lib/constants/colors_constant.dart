import 'package:flutter/material.dart';

class ColorsConstant{
  static Color primary = HexColor.fromHex('#DC143C');
  static Color darkGrey = HexColor.fromHex('#1D1D1D');
  static Color mediumGrey = HexColor.fromHex('#757575');

  static Color white = HexColor.fromHex('#FFFFFF');
  static Color black = HexColor.fromHex('#000000');

  static Color borderColor = HexColor.fromHex('#C4C4C4');
  
}

extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll('#', '');
    if(hexColorString.length == 6){
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}