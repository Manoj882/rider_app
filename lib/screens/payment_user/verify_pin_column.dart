import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';
import 'package:rider_app/widgets/custom_elevated_button_widget/general_elevated_button.dart';

class VerifyPinColumn extends StatelessWidget {
  const VerifyPinColumn({required this.onPressed, super.key});
  final Function()? onPressed;

//   @override
//   State<VerifyPinColumn> createState() => _VerifyPinColumnState();
// }

// class _VerifyPinColumnState extends State<VerifyPinColumn> {
  // final _localAuthentication = LocalAuthentication();
  // String _message = 'Not Authorized';

  // Future<bool> checkingForBioMetrics() async {
  //   bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
  //   return canCheckBiometrics;
  // }

  // Future<void> _authenticate() async {
  //   bool authenticated = false;
  //   try {
  //     authenticated = await _localAuthentication.authenticate(
  //       localizedReason: 'Verify Pin',
  //       options: AuthenticationOptions(
  //         useErrorDialogs: true,
  //         stickyAuth: true,
  //         biometricOnly: true,
  //       ),
       
       
  //     );
  //     setState(() {
  //       _message = authenticated ? 'Authorized' : 'Not Authrized';
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Verify Pin',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        SizedBox(
          height: getVerticalSize(20),
        ),
        GeneralElevatedButton(
          onPressed: onPressed,
          buttonTitle: 'Verify',
        ),
      ],
    );
  }
}
