import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/constants/font_constant.dart';
import 'package:rider_app/constants/strings_constant.dart';
import 'package:rider_app/utils/document_container.dart';
import 'package:rider_app/utils/text_form_field.dart';

class RiderRegistrationScreen extends StatelessWidget {
  const RiderRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios_outlined,
          color: ColorsConstant.borderColor,
          size: 20,
        ),
        title: Text(
          StringsConstant.registerTitle,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: ColorsConstant.darkGrey,
          ),
        ),
        elevation: 0,
        backgroundColor: ColorsConstant.white,
      ),
      body: Stack(
        children: [
          const SizedBox(
            height: 20,
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
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 4,
                  blurRadius: 10,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    GeneralTextField(
                      title: 'Bike / Scooter',
                      icon: Icon(Icons.arrow_drop_down_outlined),
                    ),
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
                          width: 177,
                          documentTitle: 'Upload Front',
                        ),
                        DocumentContainer(
                            height: 170,
                            width: 177,
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
                        onPressed: () {},
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
                      height: 150,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
