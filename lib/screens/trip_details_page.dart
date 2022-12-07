

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/models/trip_model.dart';
import 'package:rider_app/utils/general_rating_bar.dart';
import 'package:rider_app/utils/general_sliver_app_bar.dart';
import 'package:rider_app/utils/location_to_destination.dart';
import 'package:rider_app/utils/size_utils.dart';
import 'package:rider_app/widgets/general_elevated_button.dart';
import 'package:rider_app/widgets/general_table_row.dart';

class TripDetailsPage extends StatelessWidget {
  const TripDetailsPage({required this.model, super.key});

  final TripModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            GeneralSliverAppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: Column(
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
                                model.tripId,
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
                                model.date,
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
                                'Rating',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: ColorsConstant.black,
                                    ),
                              ),
                              GeneralRatingBar(rating: model.rating),
                            ],
                          ),
                          // LocationToDestination(model: model),
                          LocationToDestination(model: model),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: ColorsConstant.primary,
                                radius: getVerticalSize(33),
                                child: CircleAvatar(
                                  radius: getVerticalSize(30),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        getVerticalSize(50)),
                                    child: Image.asset(
                                      model.userImage,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                model.userName,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ],
                          ),
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
                                    model.totalDistance.toString(),
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
                                    model.fairPrice.toString(),
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
                                    model.travelTime,
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
                                        title: 'Base Fair',
                                        value: model.fairPrice.toString(),
                                      ),
                                      GeneralTableRow().buildTableSpacer(context),
                                      GeneralTableRow().buildTableRow(
                                        title: 'Surge',
                                        value: model.surge.toString(),
                                      ),
                                      GeneralTableRow().buildTableSpacer(context),
                                     
                                      GeneralTableRow().buildTableDottedDivider(context),
                                      
                                      GeneralTableRow().buildTableSpacer(context),
                                      
                                      GeneralTableRow().buildTableRow(
                                        title: 'Total',
                                        value:
                                            '${model.fairPrice + model.surge}',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 120,
                          ),
                          GeneralElevatedButton(
                            onPressed: () {},
                            buttonTitle: 'Done',
                          ),
                        ],
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




