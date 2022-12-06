import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rider_app/utils/size_utils.dart';
import '/constants/colors_constant.dart';

class GeneralImageContainer extends StatefulWidget {
  const GeneralImageContainer({
    required this.width,
    required this.xFileName,
    super.key});

  final double width;
  final XFile xFileName;

  @override
  State<GeneralImageContainer> createState() => _GeneralImageContainerState();
}

class _GeneralImageContainerState extends State<GeneralImageContainer> {
  @override
  Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(10.0),
        height: getVerticalSize(170),
        width: widget.width,
        decoration: BoxDecoration(
        border: Border.all(
          color: ColorsConstant.borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.file(
            File(widget.xFileName.path),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
    );
  }
}