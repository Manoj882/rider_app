
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/constants/font_constant.dart';
import 'package:rider_app/constants/strings_constant.dart';
import 'package:rider_app/utils/document_container.dart';
import 'package:rider_app/utils/image_picker.dart';
import 'package:rider_app/utils/text_form_field.dart';
import 'package:rider_app/widgets/general_buttom_sheet.dart';
import 'package:rider_app/widgets/general_drop_down.dart';

class RiderRegistrationPage extends StatefulWidget {
  RiderRegistrationPage({super.key});

  @override
  State<RiderRegistrationPage> createState() => _RiderRegistrationPageState();
}

class _RiderRegistrationPageState extends State<RiderRegistrationPage> {
  String vehicleValue = 'Car';

  changeVehicleValue(String value) {
    setState(() {
      vehicleValue = value;
    });
  }

  XFile? vehicleDocumentPhoto;
  XFile? drivingLicenseFront;
  XFile? drivingLicenseBack;
  XFile? vehiclePhoto;

  Future<Null> pickImage(String photoType) async{
    switch(photoType){
      case 'Vehicle Registration Document':
        if(vehicleDocumentPhoto != null){
          setState(() {
            vehicleDocumentPhoto = null;
          });
        }
        break;
      case 'Driving License Front':
        if(drivingLicenseFront != null){
          setState(() {
            drivingLicenseFront = null;
          });
        }
        break;
      case 'Driving License Back':
        if(drivingLicenseBack != null){
          setState(() {
            drivingLicenseBack = null;
          });
        }
        break;
      case 'Vehicle Photo':
        if(vehiclePhoto != null){
          setState(() {
            vehiclePhoto = null;
          });
        }
        break;
       

    }
    final imgPicker = ImagePicker();

    final pickedCamera = await imgPicker.pickImage(source: ImageSource.camera);

    switch(photoType){
      case 'Vehicle Registration Document':
        setState(() {
          vehicleDocumentPhoto = pickedCamera;
        });
        break;
      case 'Driving License Front':
        setState(() {
          drivingLicenseFront = pickedCamera;
        });
        break;
      case 'Driving License Back':
        setState(() {
          drivingLicenseBack = pickedCamera;
        });
        break;
      case 'Vehicle Photo':
        setState(() {
          vehiclePhoto = pickedCamera;
        });
        break;
    }
  }

  



  //old
  // XFile? vehicleDocumentFile;
  // final imagePicker = ImagePicker();
  Future<void> showOptionDialog(BuildContext context, String caseName) {
    
    return showDialog(
      context: context,
      builder: (context) {
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
                        // openGallery();
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
                        // openCamera();
                        pickImage(caseName);
                        Navigator.pop(context);
                      
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
      },
    );
  }

  // void openGallery() async {
  //   var imageGallery = await imagePicker.pickImage(
  //     source: ImageSource.gallery,
  //   );
  //   // final File? imageFile = File(imageGallery!.path);
  //   setState(() {
  //     vehicleDocumentFile =imageGallery;
  //   });
  //   Navigator.of(context).pop();
  // }

  // void openCamera() async {
  //   var imageGallery = await imagePicker.pickImage(
  //     source: ImageSource.camera,
  //   );
  //   setState(() {
  //     vehicleDocumentFile = XFile(imageGallery!.path);
  //   });
  //   Navigator.of(context).pop();
  // }

  @override
  Widget build(BuildContext context) {
    // print('Vehicle name: ${vehicleValue.toString()}');

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: ColorsConstant.white,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: ColorsConstant.borderColor,
                ),
              ),
              title: Text(
                StringsConstant.registerTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: ColorsConstant.darkGrey,
                ),
              ),
              centerTitle: true,
              expandedHeight: 320,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/rider_logo.png',
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 38,
                        width: 233,
                        child: Center(
                          child: Text(
                            'Begin your Rider journey with us. Sign up Today !',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorsConstant.mediumGrey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 3),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      height: 1350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Register your vehicle',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Container(
                                  height: 57,
                                  width: 374,
                                  child: Text(
                                    'We will need to verify your vehicle for authenticity and security purpose. Be sure to upload genuine documents.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FontConstant.fontFamily,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsConstant.mediumGrey,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                'Vehicle',
                                style: TextStyle(
                                  fontFamily: FontConstant.fontFamily,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              GeneralDropDown(changeVehicleValue),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Vehicle Model',
                                style: TextStyle(
                                  fontFamily: FontConstant.fontFamily,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const GeneralTextField(
                                title: 'e.g. Bajaj Pulsar NS 200',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Vehicle Registration Number',
                                style: TextStyle(
                                  fontFamily: FontConstant.fontFamily,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const GeneralTextField(
                                title: 'Type vehicle registration number',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Vehicle Registration Document',
                                style: TextStyle(
                                  fontFamily: FontConstant.fontFamily,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () async{
                                  await showOptionDialog(context, 'Vehicle Registration Document');
                                  
                                },
                                  child: Container(
                                    height: 170,
                                    width: 374,
                                    decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorsConstant.borderColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: vehicleDocumentPhoto != null
                                      ? Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.file(
                                            File(vehicleDocumentPhoto!.path),
                                            height: 150,
                                            width: 150,
                                            fit: BoxFit.contain,
                                          ),
                                      )
                                      : DocumentContainer(
                                          height: 170,
                                          width: 374,
                                          documentTitle: 'Upload Document',
                                        ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Driving License',
                                style: TextStyle(
                                  fontFamily: FontConstant.fontFamily,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const GeneralTextField(title: 'e.g. 1012451662'),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Driving License Document',
                                style: TextStyle(
                                  fontFamily: FontConstant.fontFamily,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      showOptionDialog(context, 'Driving License Front');
                                    },
                                    child: DocumentContainer(
                                      height: 170,
                                      width: 170,
                                      documentTitle: 'Upload Front',
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      showOptionDialog(context, 'Driving License Back');
                                    },
                                    child: DocumentContainer(
                                        height: 170,
                                        width: 170,
                                        documentTitle: 'Upload Back'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Vehicle Photo',
                                style: TextStyle(
                                  fontFamily: FontConstant.fontFamily,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const DocumentContainer(
                                height: 170,
                                width: 374,
                                documentTitle: 'Upload Document',
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // await GenerralButtomSheet()
                                    //     .customButtomSheet(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    backgroundColor: ColorsConstant.primary,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Register',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
