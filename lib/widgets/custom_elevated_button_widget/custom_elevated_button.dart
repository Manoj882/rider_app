import 'package:flutter/material.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';
import '/constants/colors_constant.dart';

class CustomElevatedButton extends StatefulWidget {
  CustomElevatedButton(
      {required this.onPressed,
      required this.buttonTitle,
      this.width = double.maxFinite,
      required this.backgroundColor,
      required this.textColor,
      Key? key})
      : super(key: key);

  final Function()? onPressed;
  final String buttonTitle;
  double width;
  Color backgroundColor;
  Color textColor;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getVerticalSize(60),
      width: widget.width,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ColorsConstant.primary,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: widget.backgroundColor,
        ),
        child: Center(
          child: Text(
            widget.buttonTitle,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: widget.textColor,
                ),
          ),
        ),
        
      ),
    );
  }
}
