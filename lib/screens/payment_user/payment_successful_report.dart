import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/models/trip_model.dart';
import 'package:rider_app/utils/image_utils/circle_avatar_image.dart';
import 'package:rider_app/utils/location_to_destination_utils/location_to_destination.dart';
import 'package:rider_app/utils/review_success_image_utils/review_success_image.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';
import 'package:rider_app/widgets/custom_elevated_button_widget/general_elevated_button.dart';
import 'package:rider_app/widgets/custom_table_row_widget/general_table_row.dart';

class PaymentSuccessfulReportColumn extends StatelessWidget {
  const PaymentSuccessfulReportColumn({required this.onPressed, super.key});
  final Function()? onPressed;

  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Payment Successful',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
          ),
          SizedBox(
            height: getVerticalSize(30),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: reviewSuccessImage(),
          ),
          SizedBox(
            height: getVerticalSize(30),
          ),
    
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Trip Details',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trip Id',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(
                            color: ColorsConstant.black,
                          ),
                    ),
                    Text(
                      tripList.first.tripId,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date and Time',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(
                            color: ColorsConstant.black,
                          ),
                    ),
                    Text(
                      tripList.first.date,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                
                // LocationToDestination(model: model),
                LocationToDestination(model: tripList.first),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Distance',
                          style:
                              Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          tripList.first.totalDistance.toString(),
                          style:
                              Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fair',
                          style:
                              Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          tripList.first.fairPrice.toString(),
                          style:
                              Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Travel Time',
                          style:
                              Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          tripList.first.travelTime,
                          style:
                              Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ],
                ),
    
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 161,
                  width: 373,
                  decoration: BoxDecoration(
                    color: ColorsConstant.receiptColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Receipt',
                          style:
                              Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        child: Table(
                          children: [
                            GeneralTableRow().buildTableRow(
                              context,
                              title: 'Base Fair',
                              value:
                                  'Rs. ${tripList.first.fairPrice.toString()}',
                            ),
                            GeneralTableRow()
                                .buildTableSpacer(context),
                            GeneralTableRow().buildTableRow(
                              context,
                              title: 'Surge',
                              value: 'Rs. ${tripList.first.surge.toString()}',
                            ),
                            GeneralTableRow()
                                .buildTableSpacer(context),
                            GeneralTableRow()
                                .buildTableDottedDivider(context),
                            GeneralTableRow()
                                .buildTableSpacer(context),
                            GeneralTableRow().buildTableRow(
                              context,
                              title: 'Total',
                              value:
                                  'Rs. ${tripList.first.fairPrice + tripList.first.surge}',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                GeneralElevatedButton(
                  onPressed: onPressed,
                  buttonTitle: 'Done',
                ),
              ],
            ),
        ],
      ),
    );
  }
}
