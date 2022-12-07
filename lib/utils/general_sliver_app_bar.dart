import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/constants/strings_constant.dart';

class GeneralSliverAppBar extends StatelessWidget {
  const GeneralSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
          pinned: true,
          backgroundColor: ColorsConstant.white,
          title: Text(
            StringsConstant.appBarTitle,
            style: Theme.of(context).textTheme.headline1,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/img_arrowleft.svg',
              color: ColorsConstant.darkGrey,
            ),
          ),
        );
  }
}