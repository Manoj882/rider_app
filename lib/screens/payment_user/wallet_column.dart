import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';
import 'package:rider_app/widgets/custom_elevated_button_widget/general_elevated_button.dart';
import 'package:rider_app/widgets/custom_table_row_widget/general_table_row.dart';

class WalletColumn extends StatelessWidget {
  const WalletColumn({
    required this.onPressed,
    super.key});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pay Rider',
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 18,
                color: ColorsConstant.black,
              ),
        ),
        SizedBox(
          height: getVerticalSize(5),
        ),
        Text(
          'Available Balance: Rs. 5,100',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: ColorsConstant.billColor,
              ),
        ),
        SizedBox(
          height: getVerticalSize(20),
        ),
        buildWalletDetailsRow(context, 'Rider\'s Name', 'Subash Neupane'),
        SizedBox(height: getVerticalSize(15),),
        buildWalletDetailsRow(context, 'Wallet Number', '980400000'),
        SizedBox(height: getVerticalSize(15),),
        buildWalletDetailsRow(context, 'Fare', '149'),
        SizedBox(height: getVerticalSize(15),),
        buildWalletDetailsRow(context, 'Purpose', 'Ride payment'),
        SizedBox(height: getVerticalSize(15),),
        buildWalletDetailsRow(context, 'Total Distance', '24.04 km'),
        SizedBox(height: getVerticalSize(15),),
        buildWalletDetailsRow(context, 'Mode', 'Wallet'),
        SizedBox(height: getVerticalSize(30),),
        GeneralElevatedButton(onPressed: onPressed, buttonTitle: 'Pay'),
      ],
    );
  }

  Widget buildWalletDetailsRow(
      BuildContext context, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: getVerticalSize(19),
          width: getHorizontalSize(120),
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyText1!,
          ),
        ),
        SizedBox(width: getHorizontalSize(24)),
        Container(
          height: getVerticalSize(19),
          width: getHorizontalSize(180),
          child: Text(
            value,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ],
    );
  }
}
