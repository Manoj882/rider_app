import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/constants/strings_constant.dart';
import 'package:rider_app/models/vehicle_details_model.dart';
import 'package:rider_app/utils/sliver_appbar/general_sliver_app_bar.dart';
import 'package:rider_app/utils/form_field_utils/size_utils.dart';
import 'package:rider_app/widgets/vehicle_documents/document_image.dart';
import 'package:rider_app/widgets/vehicle_documents/expandable_collapsable.dart';
import 'package:rider_app/widgets/custom_table_row_widget/general_table_row.dart';

class VehicleDetailsPage extends StatefulWidget {
  const VehicleDetailsPage({super.key});

  @override
  State<VehicleDetailsPage> createState() => _VehicleDetailsPageState();
}

class _VehicleDetailsPageState extends State<VehicleDetailsPage> {
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

    return Scaffold(
      backgroundColor: ColorsConstant.white,
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            GeneralSliverAppBar(appBarTitle: StringsConstant.myVehicle),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                  vertical: getVerticalSize(8),
                  horizontal: getHorizontalSize(16)),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SingleChildScrollView(
                      // physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          buildContainer(
                            containerWidget: GeneralExpandableContainer(
                              tileTile: 'Registration',
                              myWidget: Table(
                                children: [
                                  GeneralTableRow().buildTableSpacer(context),
                                  GeneralTableRow().buildTableRow(
                                    context,
                                    title: 'Vehicle Type',
                                    value: listOfVehicle.first.vehicleType,
                                        
                                  ),
                                  GeneralTableRow().buildTableSpacer(context),
                                  GeneralTableRow().buildTableRow(
                                    context,
                                    title: 'Vehicle Model',
                                    value: listOfVehicle.first.vehicleModel,
                                        
                                  ),
                                  GeneralTableRow().buildTableSpacer(context),
                                  GeneralTableRow().buildTableRow(
                                    context,
                                    title: 'Registration Number',
                                    value: listOfVehicle.first.registrationNumber,
                                        
                                  ),
                                ],
                              ),
                              documentWidget: DocumentImage(
                                documentImageUrl:
                                    // 'assets/images/vehicle_registration_photo.png',
                                    listOfVehicle.first.vehicleRegistrationPhoto,
                                pickImageFor: 'Vehicle Registration Document Update',
                                    
                                    
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                          buildContainer(
                            containerWidget: GeneralExpandableContainer(
                              tileTile: 'Driving License',
                              myWidget: Table(
                                children: [
                                  GeneralTableRow().buildTableSpacer(context),
                                  GeneralTableRow().buildTableRow(
                                    context,
                                    title: 'License Number',
                                    value: listOfVehicle.first.licenseNumber,
                                        
                                  ),
                                ],
                              ),
                              documentWidget: Column(
                                children: [
                                  DocumentImage(
                                    documentImageUrl:
                                        // 'assets/images/license_front.jpg',
                                        listOfVehicle.first.licenseFrontPhoto,
                                      pickImageFor: 'Vehicle Registration Document Update',
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(10),
                                  ),
                                  DocumentImage(
                                    documentImageUrl:
                                        listOfVehicle.first.licenseBackPhoto,
                                    pickImageFor: 'Vehicle Registration Document Update',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                          buildContainer(
                            containerWidget: GeneralExpandableContainer(
                              tileTile: 'Vehicle Photo',
                              documentWidget: DocumentImage(
                                documentImageUrl: listOfVehicle.first.vehiclePhoto,
                              pickImageFor: 'Vehicle Registration Document Update',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                        ],
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

  buildContainer({required Widget containerWidget}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: ColorsConstant.expandCollapseBorder,
        ),
      ),
      child: containerWidget,
    );
  }
}
