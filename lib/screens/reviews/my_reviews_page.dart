import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/constants/strings_constant.dart';
import 'package:rider_app/models/reviews_model.dart';
import 'package:rider_app/utils/image_utils/circle_avatar_image.dart';
import 'package:rider_app/utils/rating_bar_utils/general_rating_bar.dart';
import 'package:rider_app/utils/sliver_appbar/general_sliver_app_bar.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';
import 'package:rider_app/widgets/buttom_sheet/pick_date_buttomsheet/date_filter_container.dart';

class MyReviewsPage extends StatefulWidget {
  const MyReviewsPage({super.key});

  @override
  State<MyReviewsPage> createState() => _MyReviewsPageState();
}

class _MyReviewsPageState extends State<MyReviewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          GeneralSliverAppBar(
            appBarTitle: StringsConstant.myReviews,
            bottom: PreferredSize(
              preferredSize: const Size(
                double.maxFinite,
                57,
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
            padding: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(16),
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        // const DateFilterContainer(),
                        ListView.separated(
                          
                          physics: const BouncingScrollPhysics(),
                          padding: getPadding(all: 0),
                          shrinkWrap: true,
                          itemCount: listOfReviews.length,
                          itemBuilder: (context, index) {
                            return buildReviewsContainer(
                              model: listOfReviews[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              thickness: getVerticalSize(1),
                              color: ColorsConstant.expandCollapseBorder,
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
    );
  }

  buildReviewsContainer({required ReviewsModel model}) {
    return Container(
      padding: EdgeInsets.only(
        top: getVerticalSize(10),
        bottom: getVerticalSize(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatarImage(
                avatarImage: model.userImage,
              ),
              SizedBox(
                width: getHorizontalSize(15),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.userName,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  GeneralRatingBar(rating: model.rating),
                ],
              ),
              const Spacer(),
              Text(
                model.date,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: ColorsConstant.daysAgoColor,
                    ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: getVerticalSize(10)),
            child: Text(
              model.reviews,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: ColorsConstant.analyticsColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
