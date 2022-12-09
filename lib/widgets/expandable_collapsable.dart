import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/utils/size_utils.dart';
import 'package:rider_app/widgets/document_image.dart';
import 'package:rider_app/widgets/general_table_row.dart';

class GeneralExpandableContainer extends StatefulWidget {
    GeneralExpandableContainer(
    {
    required this.tileTile,
   
    // required this.documentImage,
    required this.documentWidget,
    this.myWidget = const SizedBox.shrink(),

    super.key});

  final String tileTile;
  Widget? myWidget;
  // final DocumentImage documentImage;
  final Widget documentWidget;


  @override
  State<GeneralExpandableContainer> createState() => _GeneralExpandableContainerState();
}

class _GeneralExpandableContainerState extends State<GeneralExpandableContainer> {
  bool isExpanded = false;
  UniqueKey? keyTile;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data:Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        key: keyTile,
        title: Text(
          widget.tileTile,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: ColorsConstant.darkGrey,
              ),
        ),
        iconColor: ColorsConstant.black,
        collapsedIconColor: ColorsConstant.black,
        initiallyExpanded: isExpanded,
        children: [
          Divider(
            thickness: 1,
            color: ColorsConstant.expandCollapseBorder,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(20),
            ),
            child: Column(
              children: [
                widget.myWidget!,
                SizedBox(
                  height: getVerticalSize(20),
                ),
                widget.documentWidget,
                SizedBox(
                  height: getVerticalSize(20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  }
