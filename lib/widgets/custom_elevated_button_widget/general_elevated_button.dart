import 'package:flutter/material.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';
import '/constants/colors_constant.dart';

class GeneralElevatedButton extends StatefulWidget {
  GeneralElevatedButton({
    required this.onPressed,
    required this.buttonTitle,
    this.width = double.maxFinite,
    Key? key}) : super(key: key);

  final Function()? onPressed;
  final  String buttonTitle;
  double width;
  
  @override
  State<GeneralElevatedButton> createState() => _GeneralElevatedButtonState();
}

class _GeneralElevatedButtonState extends State<GeneralElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: getVerticalSize(60),
        width: widget.width,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: ColorsConstant.primary,
          ),
          child: Center(
            child: Text(
              widget.buttonTitle,
            ),
          ),
        ),
      );
  }
}