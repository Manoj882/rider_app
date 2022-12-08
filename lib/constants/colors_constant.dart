import 'package:flutter/material.dart';

class ColorsConstant{
  static Color primary = HexColor.fromHex('#DC143C');
  static Color darkGrey = HexColor.fromHex('#1D1D1D');
  static Color mediumGrey = HexColor.fromHex('#757575');

  static Color white = HexColor.fromHex('#FFFFFF');
  static Color black = HexColor.fromHex('#000000');

  static Color borderColor = HexColor.fromHex('#C4C4C4');
  static Color containerColor = HexColor.fromHex('#F7F8F9');
  static Color starColor = HexColor.fromHex('#F0C21F');
  static Color receiptColor = HexColor.fromHex('#F2F2F2');
  static Color fliterContainer = HexColor.fromHex('#F9F9F9');

  static Color radioColor1 = HexColor.fromHex('#2A3887');
  static Color radioColor2 = HexColor.fromHex('#007B55');

  static Color analyticsColor = HexColor.fromHex('#1B1D1F');
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