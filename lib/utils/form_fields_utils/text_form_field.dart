import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';

class GeneralTextField extends StatefulWidget {
  const GeneralTextField({
    required this.title,
    this.icon,
    this.controller,
    this.enabled = true,
    super.key});

  final String title;
  final Icon? icon;
  final TextEditingController? controller;
  final bool? enabled;

  @override
  State<GeneralTextField> createState() => _GeneralTextFieldState();
}

class _GeneralTextFieldState extends State<GeneralTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.title,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ColorsConstant.borderColor,
          ),
          borderRadius: BorderRadius.circular(30), 
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ColorsConstant.borderColor,
          ),
          borderRadius: BorderRadius.circular(30), 
        ),
        suffixIcon: widget.icon,
        
      ),
    );
  }
}