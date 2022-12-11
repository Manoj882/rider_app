import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/constants/strings_constant.dart';
import 'package:rider_app/models/trip_model.dart';
import 'package:rider_app/utils/image_utils/circle_avatar_image.dart';
import 'package:rider_app/utils/rating_bar_utils/general_rating_bar.dart';
import 'package:rider_app/utils/sliver_appbar/general_sliver_app_bar.dart';
import 'package:rider_app/utils/location_to_destination_utils/location_to_destination.dart';
import 'package:rider_app/utils/form_field_utils/size_utils.dart';
import 'package:rider_app/widgets/custom_elevated_button_widget/general_elevated_button.dart';
import 'package:rider_app/widgets/custom_table_row_widget/general_table_row.dart';

class TripDetailsPage extends StatelessWidget {
  const TripDetailsPage({required this.model, super.key});

  final TripModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            GeneralSliverAppBar(
              appBarTitle: StringsConstant.rideRegistration,
            ),
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
                              CircleAvatarImage(avatarImage: model.userImage),
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
                                        context,
                                        title: 'Base Fair',
                                        value:
                                            'Rs. ${model.fairPrice.toString()}',
                                      ),
                                      GeneralTableRow()
                                          .buildTableSpacer(context),
                                      GeneralTableRow().buildTableRow(
                                        context,
                                        title: 'Surge',
                                        value: 'Rs. ${model.surge.toString()}',
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
                                            'Rs. ${model.fairPrice + model.surge}',
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
