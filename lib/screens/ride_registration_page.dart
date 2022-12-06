import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '/constants/assets_constant.dart';
import '/constants/colors_constant.dart';
import '/constants/strings_constant.dart';
import '/utils/document_container.dart';
import '/utils/text_form_field.dart';
import '/widgets/general_buttom_sheet.dart';
import '/widgets/general_drop_down.dart';
import '/widgets/general_elevated_button.dart';
import '/widgets/general_image_container.dart';

class RiderRegistrationPage extends StatefulWidget {
  const RiderRegistrationPage({super.key});

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
                StringsConstant.appBarTitle,
                style: Theme.of(context).textTheme.headline1,
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
                          ImageConstants.rider_logo,
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
                            StringsConstant.beginTitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
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
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  StringsConstant.registerTitle,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Container(
                                  height: 57,
                                  width: 374,
                                  child: Text(
                                    StringsConstant.verifyInfo,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                StringsConstant.vehicle,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              GeneralDropDown(changeVehicleValue),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                StringsConstant.vehicleModel,
                                style: Theme.of(context).textTheme.headline2,
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
                              Text(
                                StringsConstant.vehicleRegisNo,
                                style: Theme.of(context).textTheme.headline2,
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
                              Text(
                                StringsConstant.vehicleRegisDocument,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showOptionDialog(
                                      context, 'Vehicle Registration Document');
                                },
                                child: vehicleDocumentPhoto != null
                                    ? GeneralImageContainer(
                                        width: 374,
                                        xFileName: vehicleDocumentPhoto!)
                                    : const DocumentContainer(
                                        height: 170,
                                        width: 374,
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
                              const SizedBox(
                                height: 8,
                              ),
                              const GeneralTextField(title: 'e.g. 1012451662'),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                StringsConstant.drivingLicenseDocument,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              const SizedBox(
                                height: 8,
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
                                            width: 170,
                                            xFileName: drivingLicenseFront!)
                                        : const DocumentContainer(
                                            height: 170,
                                            width: 170,
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
                                            width: 170,
                                            xFileName: drivingLicenseBack!)
                                        : const DocumentContainer(
                                            height: 170,
                                            width: 170,
                                            documentTitle: 'Upload Back'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
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
                                        width: 374, xFileName: vehiclePhoto!)
                                    : const DocumentContainer(
                                        height: 170,
                                        width: 374,
                                        documentTitle: 'Upload Document',
                                      ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              GeneralElevatedButton(
                                onPressed: () async{
                                  await GeneralButtomSheet().customButtomSheet(context);
                                },
                                buttonTitle: StringsConstant.register,
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
