import 'package:flutter/material.dart';
import '/constants/colors_constant.dart';

class GeneralElevatedButton extends StatefulWidget {
  const GeneralElevatedButton({
    required this.onPressed,
    required this.buttonTitle,
    Key? key}) : super(key: key);

  final Function()? onPressed;
  final  String buttonTitle;
  
  @override
  State<GeneralElevatedButton> createState() => _GeneralElevatedButtonState();
}

class _GeneralElevatedButtonState extends State<GeneralElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
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