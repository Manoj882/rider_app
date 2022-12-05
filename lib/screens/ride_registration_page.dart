import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/constants/font_constant.dart';
import 'package:rider_app/constants/strings_constant.dart';
import 'package:rider_app/utils/document_container.dart';
import 'package:rider_app/utils/text_form_field.dart';
import 'package:rider_app/widgets/general_buttom_sheet.dart';
import 'package:rider_app/widgets/general_drop_down.dart';

class RiderRegistrationPage extends StatelessWidget {
  RiderRegistrationPage({super.key});

  final vehicleController = TextEditingController();

  changeVehicleValue(value) {
    vehicleController.text = value;
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).padding.top);

    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   leading: Icon(
      //     Icons.arrow_back_ios_outlined,
      //     color: ColorsConstant.borderColor,
      //     size: 20,
      //   ),
      //   title: Text(
      //     StringsConstant.registerTitle,
      //     style: TextStyle(
      //       fontWeight: FontWeight.w700,
      //       fontSize: 16,
      //       color: ColorsConstant.darkGrey,
      //     ),
      //   ),
      //   elevation: 0,
      //   backgroundColor: ColorsConstant.white,
      // ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: ColorsConstant.white,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
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
              expandedHeight: 300,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  child: SingleChildScrollView(
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
                        SizedBox(
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
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 1400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: Offset(0, 3),
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
                            SizedBox(
                              height: 30,
                            ),
                            Align(
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
                            SizedBox(
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
                            GeneralTextField(
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
                            GeneralTextField(
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
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: DocumentContainer(
                                height: 170,
                                width: 374,
                                documentTitle: 'Upload Document',
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
                            GeneralTextField(title: 'e.g. 1012451662'),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DocumentContainer(
                                  height: 170,
                                  width: 170,
                                  documentTitle: 'Upload Front',
                                ),
                                DocumentContainer(
                                    height: 170,
                                    width: 170,
                                    documentTitle: 'Upload Back'),
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
                            DocumentContainer(
                              height: 170,
                              width: 374,
                              documentTitle: 'Upload Document',
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  GenerralButtomSheet()
                                      .customButtomSheet(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: ColorsConstant.primary,
                                ),
                                child: Center(
                                  child: Text(
                                    'Register',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
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
          ],
        ),
      ),
    );
  }
}
