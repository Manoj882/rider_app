import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/constants/font_constant.dart';

class DocumentContainer extends StatefulWidget {
  const DocumentContainer({
    required this.documentTitle,
    required this.height,
    required this.width,
    super.key});

  final String documentTitle;
  final double height;
  final double width;

  @override
  State<DocumentContainer> createState() => _DocumentContainerState();
}

class _DocumentContainerState extends State<DocumentContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
    
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsConstant.borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.photo_album_outlined,
              size: 27,
              color: ColorsConstant.borderColor,
            ),
          ),
          Text(
            'Upload Document',
            style: TextStyle(
              fontFamily: FontConstant.fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: ColorsConstant.borderColor,
            ),
          ),
        ],
      ),
    );
  }
}