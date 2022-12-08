import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/utils/size_utils.dart';

class GeneralTableRow{
  buildTableDivider(BuildContext context) {
    return TableRow(
      children: [
        Divider(
          thickness: 1,
          color: ColorsConstant.borderColor,
        ),
        Divider(
          thickness: 1,
          color: ColorsConstant.borderColor,
        ),
       
        
      ],
    );
  }

  buildTableDottedDivider(BuildContext context) {
    return TableRow(
      children: [
        DottedLine(
          dashColor: ColorsConstant.borderColor,
        ),
        DottedLine(
          dashColor: ColorsConstant.borderColor,
        ),
        
      ],
    );
  }

  buildTableRow(
    BuildContext context,{
    required String title,
    required String value,
  }) {
    return TableRow(
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
        ),
        Text(
          'Rs. $value',
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
    );
  }

  buildTableSpacer(BuildContext context) {
    return TableRow(
      children: [
        SizedBox(
          height: getVerticalSize(10),
        ),
        SizedBox(
          height: getVerticalSize(10),
        ),
      ],
    );
  }
}