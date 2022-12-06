import 'package:flutter/material.dart';
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
              const SizedBox(
                height: 20,
              ),
              Text(
                StringsConstant.registerTitle,
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                StringsConstant.verifyInfo,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 30),
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
