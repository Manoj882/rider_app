import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';

class ChooseUserOption<T> extends StatelessWidget {
  ChooseUserOption(
      {required this.value,
      required this.groupValue,
      this.label,
      this.text,
      required this.onChanged,
      super.key});

  final T value;
  final T? groupValue;
  String? label;
  String? text;
  final ValueChanged<T?> onChanged;

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;
    return Container(
      width: getHorizontalSize(20),
      height: getVerticalSize(20),
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(
            color: ColorsConstant.borderColor,
          ),
        ),
        color: isSelected ? ColorsConstant.primary : ColorsConstant.white,
      ),
      child: isSelected
          ? SvgPicture.asset('assets/images/img_tick.svg')
          : const SizedBox.shrink(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(all: 8),
      child: InkWell(
        onTap: () => onChanged(value),
        child: Padding(
          padding: getPadding(
            all: 5,
          ),
          child: _buildLabel(),
        ),
      ),
    );
  }
}
