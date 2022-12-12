import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rider_app/utils/form_field_utils/size_utils.dart';
import '/constants/assets_constant.dart';
import '/constants/colors_constant.dart';
import '/constants/strings_constant.dart';
import '../../utils/vehicle_document_utils/document_container.dart';
import '../../utils/form_fields_utils/text_form_field.dart';
import '../../widgets/buttom_sheet/general_buttom_sheet.dart';
import '../../widgets/dropdown_widgets/general_drop_down.dart';
import '../../widgets/custom_elevated_button_widget/general_elevated_button.dart';
import '../../widgets/xFile_image_container_widget/general_image_container.dart';

class RiderRegistrationPage extends StatefulWidget {
  const RiderRegistrationPage({super.key});

  @override
  State<RiderRegistrationPage> createState() => _RiderRegistrationPageState();
}

class _RiderRegistrationPageState extends State<RiderRegistrationPage> {
  String? vehicleValue;

  changeVehicleValue(String value) {
    setState(() {
      vehicleValue = value.toString();
    });
  }

  XFile? vehicleDocumentPhoto;
  XFile? drivingLicenseFront;
  XFile? drivingLicenseBack;
  XFile? vehiclePhoto;

  Future<Null> pickImage(String photoType) async {
    switch (photoType) {
      case 'Vehicle Registration Document':
        if (vehicleDocumentPhoto != null) {
          setState(() {
            vehicleDocumentPhoto = null;
          });
        }
        break;
      case 'Driving License Front':
        if (drivingLicenseFront != null) {
          setState(() {
            drivingLicenseFront = null;
          });
        }
        break;
      case 'Driving License Back':
        if (drivingLicenseBack != null) {
          setState(() {
            drivingLicenseBack = null;
          });
        }
        break;
      case 'Vehicle Photo':
        if (vehiclePhoto != null) {
          setState(() {
            vehiclePhoto = null;
          });
        }
        break;
    }
    final imagePicker = ImagePicker();

    final pickedCamera = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 100);

    switch (photoType) {
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
                          Icon(IconDataConstant.collectionIcon),
                          Text(StringsConstant.gallery),
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
                        children: [
                          Icon(IconDataConstant.cameraIcon),
                          Text(StringsConstant.camera),
                        ],
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstant.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: ColorsConstant.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: ColorsConstant.borderColor,
                ),
              ),
              title: Text(
                StringsConstant.rideRegistration,
                style: Theme.of(context).textTheme.headline1,
              ),
              centerTitle: true,
              expandedHeight: getVerticalSize(320),
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: getVerticalSize(50),
                      ),
                      Center(
                        child: Image.asset(
                          ImageConstants.rider_logo,
                          height: getSize(200),
                          width: getSize(200),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: getVerticalSize(38),
                        width: getHorizontalSize(233),
                        child: Center(
                          child: Text(
                            StringsConstant.beginTitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(30),
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
                      // height: 1350,
                      // height: MediaQuery.of(context).size.height * 1.63,
                      // height: getVerticalSize(1350),
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
                        padding: EdgeInsets.symmetric(
                          vertical: getVerticalSize(8),
                          horizontal: getHorizontalSize(16),
                        ),
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: getVerticalSize(30),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  StringsConstant.registerTitle,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: getVerticalSize(8),
                                    horizontal: getHorizontalSize(16)),
                                child: Container(
                                  height: getVerticalSize(57),
                                  width: getHorizontalSize(374),
                                  child: Text(
                                    StringsConstant.verifyInfo,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: getVerticalSize(30),
                              ),
                              Text(
                                StringsConstant.vehicle,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              SizedBox(
                                height: getVerticalSize(8),
                              ),
                              //drop down for vehicle item
                              GeneralDropDown(changeVehicleValue),

                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              Text(
                                StringsConstant.vehicleModel,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              SizedBox(
                                height: getVerticalSize(8),
                              ),
                              const GeneralTextField(
                                title: 'e.g. Bajaj Pulsar NS 200',
                              ),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              Text(
                                StringsConstant.vehicleRegisNo,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              SizedBox(
                                height: getVerticalSize(8),
                              ),
                              const GeneralTextField(
                                title: 'Type vehicle registration number',
                              ),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              Text(
                                StringsConstant.vehicleRegisDocument,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              SizedBox(
                                height: getVerticalSize(10),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showOptionDialog(
                                      context, 'Vehicle Registration Document');
                                },
                                child: vehicleDocumentPhoto != null
                                    ? GeneralImageContainer(
                                        width: getHorizontalSize(374),
                                        xFileName: vehicleDocumentPhoto!)
                                    : DocumentContainer(
                                        height: getVerticalSize(170),
                                        width: getHorizontalSize(374),
                                        documentTitle: 'Upload Document',
                                      ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                StringsConstant.drivingLicense,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              SizedBox(
                                height: getVerticalSize(8),
                              ),
                              const GeneralTextField(title: 'e.g. 1012451662'),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              Text(
                                StringsConstant.drivingLicenseDocument,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              SizedBox(
                                height: getVerticalSize(8),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showOptionDialog(
                                          context, 'Driving License Front');
                                    },
                                    child: drivingLicenseFront != null
                                        ? GeneralImageContainer(
                                            width: getHorizontalSize(170),
                                            xFileName: drivingLicenseFront!)
                                        : DocumentContainer(
                                            height: getVerticalSize(170),
                                            width: getHorizontalSize(170),
                                            documentTitle: 'Upload Front',
                                          ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showOptionDialog(
                                          context, 'Driving License Back');
                                    },
                                    child: drivingLicenseBack != null
                                        ? GeneralImageContainer(
                                            width: getHorizontalSize(170),
                                            xFileName: drivingLicenseBack!)
                                        : DocumentContainer(
                                            height: getVerticalSize(170),
                                            width: getHorizontalSize(170),
                                            documentTitle: 'Upload Back'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              Text(
                                StringsConstant.vehiclePhoto,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showOptionDialog(context, 'Vehicle Photo');
                                },
                                child: vehiclePhoto != null
                                    ? GeneralImageContainer(
                                        width: getHorizontalSize(374),
                                        xFileName: vehiclePhoto!,
                                      )
                                    : DocumentContainer(
                                        height: getVerticalSize(170),
                                        width: getHorizontalSize(374),
                                        documentTitle: 'Upload Document',
                                      ),
                              ),
                              SizedBox(
                                height: getVerticalSize(30),
                              ),
                              GeneralElevatedButton(
                                onPressed: () async {
                                  await GeneralButtomSheet()
                                      .customButtomSheet(context);
                                },
                                buttonTitle: StringsConstant.register,
                              ),
                              SizedBox(
                                height: getVerticalSize(20),
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
