import 'package:flutter/material.dart';
import 'package:rider_app/utils/size_utils.dart';
import '/constants/strings_constant.dart';
import '/widgets/general_elevated_button.dart';

class GeneralButtomSheet {
  customButtomSheet(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: getVerticalSize(20),
              ),
              Text(
                StringsConstant.registerTitle,
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: getVerticalSize(10),
              ),
              Text(
                StringsConstant.verifyInfo,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: getVerticalSize(30)),
              GeneralElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                buttonTitle: StringsConstant.done,
              ),
            ],
          ),
        );
      },
    );
  }
}
