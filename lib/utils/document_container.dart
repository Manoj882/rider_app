import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

// class DocumentContainer extends StatefulWidget {
//   const DocumentContainer({
//     required this.documentTitle,
//     required this.height,
//     required this.width,
//     super.key});

//   final String documentTitle;
//   final double height;
//   final double width;



//   @override
//   State<DocumentContainer> createState() => _DocumentContainerState();
// }

// class _DocumentContainerState extends State<DocumentContainer> {
//   XFile? imageFile;
//   final imagePicker = ImagePicker();
//   Future<void> showOptionDialog(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Upload From'),
//           content: ListBody(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   openGallery();
//                 },
//                 child: Text('Gallery'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void openGallery() async {
//     var imageGallery = await imagePicker.pickImage(
//       source: ImageSource.gallery,
//     );
//     setState(() {
//       imageFile = XFile(imageGallery!.path);
//     });

//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.height,
//       width: widget.width,
    
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: ColorsConstant.borderColor,
//           width: 1,
//         ),
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: imageFile != null 
//       ? Image.file(imageFile as File,
//       height: 150,
//       width: 150,
//       )
//       : Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Icon(
//               Icons.photo_album_outlined,
//               size: 27,
//               color: ColorsConstant.borderColor,
//             ),
//           ),
//           GestureDetector(
//             onTap: (){
//               showOptionDialog(context);
//             },
//             child: Text(
//               'Upload Document',
//               style: TextStyle(
//                 fontFamily: FontConstant.fontFamily,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w300,
//                 color: ColorsConstant.borderColor,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }



// }