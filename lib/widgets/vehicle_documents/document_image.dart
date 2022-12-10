import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/utils/form_field_utils/size_utils.dart';

class DocumentImage extends StatefulWidget {
  const DocumentImage({required this.documentImageUrl, 
  required this.pickImageFor,
  super.key});

  final String documentImageUrl;
  final String pickImageFor;

  @override
  State<DocumentImage> createState() => _DocumentImageState();
}

class _DocumentImageState extends State<DocumentImage> {

  XFile? vehicleRegisUpdateImage;
  XFile? licenseFrontUpdateImage;
  XFile? licenseBackUpdateImage;
  XFile? vehicleUpdateImage;

  

  Future<void> pickImage(String updatePhoto) async{
    final imgePicker = ImagePicker();
    final pickedGallery = await imgePicker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    switch (updatePhoto){
      case 'Vehicle Registration Document Update':
        setState(() {
          vehicleRegisUpdateImage = pickedGallery;
        });
        break;
      case 'Driving License Front Update':
        setState(() {
          licenseFrontUpdateImage = pickedGallery;
        });
        break;
      case 'Driving License Back Update':
        setState(() {
          licenseBackUpdateImage = pickedGallery;
        });
        break;
      case 'Vehicle Photo Update':
        setState(() {
          vehicleUpdateImage = pickedGallery;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              getVerticalSize(30),
            ),
            side: BorderSide(
              width: 1,
              color: ColorsConstant.expandCollapseBorder,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(getVerticalSize(30)),
            child: vehicleRegisUpdateImage != null
            ? Image.file(File(vehicleRegisUpdateImage!.path))
            :Image.asset(
              widget.documentImageUrl,
              height: getVerticalSize(282),
              width: getHorizontalSize(374),
              fit: BoxFit.cover,
            ),

          ),
        ),
        Padding(
          padding: getPadding(all: 12),
          child: Container(
            height: getVerticalSize(40),
            width: getHorizontalSize(40),
            decoration: BoxDecoration(
              color: ColorsConstant.white,
              borderRadius: BorderRadius.circular(getVerticalSize(50)),
            ),
            child: IconButton(
              onPressed: () {
                pickImage(widget.pickImageFor);
              },
              icon: SvgPicture.asset(
                'assets/images/img_edit_40X40.svg',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
