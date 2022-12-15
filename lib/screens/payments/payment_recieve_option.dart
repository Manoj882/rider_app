import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/screens/payment_user/user_side_page.dart';
import 'package:rider_app/utils/divider/custom_divider.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';
import 'package:rider_app/widgets/container_widget/curved_buttom_container.dart';
import 'package:rider_app/widgets/custom_elevated_button_widget/general_elevated_button.dart';

class PaymentRecieveOption extends StatefulWidget {
  const PaymentRecieveOption(this.function, {super.key});

  final Function(String) function;

  @override
  State<PaymentRecieveOption> createState() => _PaymentRecieveOptionState();
}

class _PaymentRecieveOptionState extends State<PaymentRecieveOption> {
  late String groupPaymentOptionValue;

  @override
  void initState() {
    super.initState();
    groupPaymentOptionValue = 'Cash';
    // widget.function(groupPaymentOptionValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Select payment recieving method',
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(
          height: getVerticalSize(36),
        ),
        buildPaymentMethodRow('Cash', 'Request client for cash'),
        SizedBox(
          height: getVerticalSize(15),
        ),
        divider(),
        SizedBox(
          height: getVerticalSize(15),
        ),
        buildPaymentMethodRow('Paywell', 'Request Ride initiator for fare'),
        SizedBox(
          height: getVerticalSize(15),
        ),
        divider(),
        SizedBox(
          height: getVerticalSize(15),
        ),
        buildPaymentMethodRow('QR', 'Request client for QR pay'),
        SizedBox(
          height: getVerticalSize(30),
        ),
        GeneralElevatedButton(
          onPressed: () {
            //go to user side page (for just checking)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => UserSidePage(),
                settings: RouteSettings(arguments: groupPaymentOptionValue)
              ),
            );
          },
          buttonTitle: 'Request',
        ),
      ],
    );
  }

  Widget getPaymentRadio(String value) {
    return Radio<String>(
      value: value,
      groupValue: groupPaymentOptionValue,
      fillColor: MaterialStateColor.resolveWith(
        (states) => ColorsConstant.primary,
      ),
      onChanged: (value) {
        setState(() {
          groupPaymentOptionValue = value.toString();
        });
        widget.function(value!);
      },
    );
  }

  Widget buildPaymentMethodRow(
      String paymentMethodName, String requestMethodBody) {
    return Row(
      children: [
        getPaymentRadio(paymentMethodName),
        Image.asset(
          'assets/images/img_paywell.png',
          height: 46,
          width: 55,
        ),
        SizedBox(
          width: getHorizontalSize(10),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              paymentMethodName,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: getVerticalSize(5),
            ),
            Text(
              requestMethodBody,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.w300,
                    color: ColorsConstant.daysAgoColor,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
