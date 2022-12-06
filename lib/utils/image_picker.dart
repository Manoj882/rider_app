

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rider_app/constants/font_constant.dart';
import 'package:rider_app/constants/values_constant.dart';
import 'package:rider_app/utils/document_container.dart';

// class GeneralPicTaker {
//   Future<void> showBottomSheet(BuildContext context) async {
//     final imagePicker = ImagePicker();
//     await showModalBottomSheet(
//       context: context,
//       builder: (_) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Upload Photo From',
//                 style: TextStyle(
//                   fontFamily: FontConstant.fontFamily,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   buildPhotoChooseOption(
//                     context,
//                     function: () async {
//                       final xFile = await imagePicker.pickImage(
//                         source: ImageSource.gallery,
//                       );
//                       // if(xFile != null){
//                       //   Image.file(xFile as File);
//                       // }
//                     },
//                     iconData: Icons.collections_outlined,
//                     label: 'Gallery',
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Column buildPhotoChooseOption(
//     BuildContext context, {
//     required Function function,
//     required IconData iconData,
//     required String label,
//   }) {
//     return Column(
//       children: [
//         IconButton(
//           onPressed: () {},
//           icon: Icon(iconData),
//           iconSize: AppSize.size30,
//         ),
//         Text(label),
//       ],
//     );
//   }
// }

// class MyImagePicker extends StatefulWidget {
//   const MyImagePicker({super.key});

//   @override
//   State<MyImagePicker> createState() => _MyImagePickerState();
// }

// class _MyImagePickerState extends State<MyImagePicker> {
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
//                 onTap: () {},
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
//     // Navigator.pop(context);
//   }
//   // Widget displayImage(){
//   //   if(imageFile == null){
//   //     return Text('No document selected');
//   //   } else {
//   //     return Image.file(imageFile);
//   //   }
//   // }
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: 170,
//         width: 374,
//         child: imageFile != null 
//         ?Image.file(imageFile as File)
//         : DocumentContainer(
//             height: 170,
//             width: 374,
//             documentTitle: 'Upload Document',
//           ),


//       ),
//     );
//   }
// }


class GeneralPictureTaker extends StatefulWidget {
  GeneralPictureTaker({
    required this.fileName,
    super.key});

  XFile? fileName;

  @override
  State<GeneralPictureTaker> createState() => _GeneralPictureTakerState();
}

class _GeneralPictureTakerState extends State<GeneralPictureTaker> {
  
  final imagePicker = ImagePicker();
  void openGallery() async {
    var imageGallery = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    // final File? imageFile = File(imageGallery!.path);
    setState(() {
      widget.fileName =imageGallery;
    });
    Navigator.of(context).pop();
  }

  void openCamera() async {
    var imageGallery = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      widget.fileName = XFile(imageGallery!.path);
    });
    Navigator.of(context).pop();
  }

  // Future<void>showOptionDialog(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Center(
  //           child: Text('Upload From'),
  //         ),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   GestureDetector(
  //                     onTap: () {
  //                       openGallery();
  //                     },
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.center,
  //                       children: [
  //                         Icon(Icons.collections_outlined),
  //                         Text('Gallery')
  //                       ],
  //                     ),
  //                   ),
  //                   GestureDetector(
  //                     onTap: () {
  //                       openCamera();
  //                     },
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.center,
  //                       children: [Icon(Icons.camera_outlined), Text('Camera')],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title: Center(
            child: Text('Upload From'),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        openGallery();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.collections_outlined),
                          Text('Gallery')
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        openCamera();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Icon(Icons.camera_outlined), Text('Camera')],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );

  
  }
}
