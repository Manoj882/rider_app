import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/utils/navigate/navigate.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';

class CustomListTile {
  buildListTile(
    BuildContext context, {
    required String title,
    String? subTitle,
    Widget? widget,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        vertical: getVerticalSize(0),
      ),
      isThreeLine: true,
      visualDensity: const VisualDensity(vertical: -4),
      title: Padding(
        padding: EdgeInsets.only(bottom: getVerticalSize(3)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      subtitle: Text(
        subTitle!,
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

  customListTile(
    BuildContext context, {
    Widget? leading,
    required String title,
    String? subTitle = '',
    Widget? trailingWidget,
  }) {
    return ListTile(
      contentPadding: getPadding(all: 0),
      horizontalTitleGap: 4,
      leading: leading,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: ColorsConstant.tileTitleColor,
            ),
      ),
      subtitle: Text(
        subTitle.toString(),
      ),
      trailing: trailingWidget,
    );
  }
}
