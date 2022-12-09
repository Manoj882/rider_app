import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/constants/strings_constant.dart';
import 'package:rider_app/models/trip_model.dart';
import 'package:rider_app/screens/trip_details_page.dart';
import 'package:rider_app/utils/general_rating_bar.dart';
import 'package:rider_app/utils/general_sliver_app_bar.dart';
import 'package:rider_app/utils/location_to_destination.dart';
import 'package:rider_app/utils/size_utils.dart';
import 'package:rider_app/widgets/buttom_sheet/pick_date_buttomsheet/date_filter_container.dart';

class RequestMoneyPage extends StatefulWidget {
  const RequestMoneyPage({super.key});

  @override
  State<RequestMoneyPage> createState() => _RequestMoneyPageState();
}

class _RequestMoneyPageState extends State<RequestMoneyPage> {
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstant.white,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            const GeneralSliverAppBar(appBarTitle: StringsConstant.rideRegistration),
            SliverPadding(
              padding: getPadding(top: 0, bottom: 0, right: 16, left: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          //filter container 
                          DateFilterContainer(),

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
                                      builder: (_) => TripDetailsPage(model: tripList[index],),
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
      color: Colors.white,
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
                  Text(model.tripId),
                ],
              ),
              Text(model.date),
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
              Text('Rs. ${model.price}'),
            ],
          ),
        ],
      ),
    );
  }
}
