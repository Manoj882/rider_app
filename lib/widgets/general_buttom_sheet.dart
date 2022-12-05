import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/constants/font_constant.dart';

class GenerralButtomSheet {
  customButtomSheet(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context){
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20,),
              Text(
                'Register your vehicle',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'We will need to verify your vehicle for authenticity and security purpose. Be sure to upload genuine documents.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontConstant.fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorsConstant.mediumGrey,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: ColorsConstant.primary,
                ),
                child: Center(
                  child: Text(
                    'Done',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
