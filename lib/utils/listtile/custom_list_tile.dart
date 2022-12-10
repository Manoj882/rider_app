import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rider_app/utils/navigate/navigate.dart';
import 'package:rider_app/utils/form_field_utils/size_utils.dart';

class CustomListTile {
  buildListTile(
    BuildContext context, {
    required String title,
    required String subTitle,
    Widget? widget,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        vertical: getVerticalSize(15),
      ),
      title: Padding(
        padding: EdgeInsets.only(bottom: getVerticalSize(5)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.w400,
            ),
      ),
      trailing: SvgPicture.asset('assets/images/img_arrowright.svg'),
      onTap: () => navigate(
        context,
        widget!,
      ),
    );
  }
}
