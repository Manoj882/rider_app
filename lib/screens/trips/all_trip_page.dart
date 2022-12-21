import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/constants/routes_constant.dart';
import 'package:rider_app/constants/strings_constant.dart';
import 'package:rider_app/models/trip_model.dart';
import 'package:rider_app/screens/trips/trip_details_page.dart';
import 'package:rider_app/utils/rating_bar_utils/general_rating_bar.dart';
import 'package:rider_app/utils/sliver_appbar/general_sliver_app_bar.dart';
import 'package:rider_app/utils/location_to_destination_utils/location_to_destination.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';
import 'package:rider_app/widgets/buttom_sheet/pick_date_buttomsheet/date_filter_container.dart';

class AllTripPage extends StatefulWidget {
  const AllTripPage({super.key});

  @override
  State<AllTripPage> createState() => _AllTripPageState();
}

class _AllTripPageState extends State<AllTripPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstant.white,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            GeneralSliverAppBar(
              appBarTitle: StringsConstant.rideRegistration,
              bottom: PreferredSize(
                preferredSize: Size(
                  double.maxFinite,
                  getVerticalSize(57),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalSize(16),
                  ),
                  child: const DateFilterContainer(),
                ),
              ),
            ),
            SliverPadding(
              padding: getPadding(
                top: getVerticalSize(0),
                bottom: getVerticalSize(0),
                right: getHorizontalSize(16),
                left: getHorizontalSize(16),
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          //filter container
                          // DateFilterContainer(),

                          SizedBox(
                            height: getVerticalSize(10),
                          ),

                          //card container
                          ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: tripList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => TripDetailsPage(
                                        model: tripList[index],
                                      ),
                                    ),
                                  );
                                },
                                child: getTripCard(
                                  tripList[index],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                thickness: 1,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container getTripCard(TripModel model) {
    return Container(
      color: ColorsConstant.white,
      padding: EdgeInsets.symmetric(
        vertical: getVerticalSize(10),
        horizontal: getHorizontalSize(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Trip ID'),
                  SizedBox(
                    width: getHorizontalSize(5),
                  ),
                  Text(
                    model.tripId,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
              Text(model.date, style: Theme.of(context).textTheme.headline2),
            ],
          ),
          SizedBox(
            height: getVerticalSize(10),
          ),
          LocationToDestination(model: model),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: ColorsConstant.primary,
                    radius: getVerticalSize(33),
                    child: CircleAvatar(
                      radius: getVerticalSize(30),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(getVerticalSize(50)),
                        child: Image.asset(
                          model.userImage,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getHorizontalSize(5),
                  ),
                  GeneralRatingBar(rating: model.rating),
                ],
              ),
              Text(
                'Rs. ${model.price}',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
