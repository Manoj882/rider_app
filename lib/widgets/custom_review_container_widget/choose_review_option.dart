import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';

class ChooseReviewOption<T> extends StatelessWidget {
  ChooseReviewOption(
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

  Widget _buildLabelContainer() {
    final bool isSelected = value == groupValue;
    return Container(
      height: getVerticalSize(47),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color:
            isSelected ? ColorsConstant.primary : ColorsConstant.receiptColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          value.toString(),
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: _buildLabelContainer(),
    );
  }
}
