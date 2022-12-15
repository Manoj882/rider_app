import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/utils/rating_bar_utils/general_rating_bar.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';
import 'package:rider_app/widgets/custom_elevated_button_widget/general_elevated_button.dart';
import 'package:rider_app/widgets/custom_review_container_widget/choose_review_option.dart';

class FeedbackOnRiderColumn extends StatefulWidget {
  const FeedbackOnRiderColumn({required this.onPressed, super.key});

  final Function()? onPressed;

  @override
  State<FeedbackOnRiderColumn> createState() => _FeedbackOnRiderColumnState();
}

class _FeedbackOnRiderColumnState extends State<FeedbackOnRiderColumn> {
  String? groupReviewOptionValue;


  ValueChanged<String?> _reviewChangedHandler() {
    return (value) {
      setState(() {
        groupReviewOptionValue = value!;
      });
    };
  }

  double? rating;

  ratingValueChanged(double value){
    setState(() {
      rating = value;
    });
  }

  @override
  void initState() {
    super.initState();
    groupReviewOptionValue = 'Good';
    rating = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    print('Reviews value: ${groupReviewOptionValue.toString()}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'How was your ride experience',
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          height: getVerticalSize(17),
        ),
        Row(
          children: [
            GeneralRatingBar(rating: rating, function:ratingValueChanged,),
            SizedBox(
              width: getHorizontalSize(17),
            ),
            Text(
              '($rating / 5)',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 18,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: getVerticalSize(22),
        ),
        Text(
          'Any feedbacks on Rider ?',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: ColorsConstant.analyticsColor,
              ),
        ),
        SizedBox(
          height: getVerticalSize(19),
        ),
        getAllReviewsOption(
          onPressed: widget.onPressed,
        ),
      ],
    );
  }

  getAllReviewsOption({required Function()? onPressed}) {
    return Column(
      children: [
        ChooseReviewOption(
          value: 'Good',
          groupValue: groupReviewOptionValue,
          onChanged: _reviewChangedHandler(),
        ),
        SizedBox(
          height: getVerticalSize(20),
        ),
        ChooseReviewOption(
          value: 'Average',
          groupValue: groupReviewOptionValue,
          onChanged: _reviewChangedHandler(),
        ),
        SizedBox(
          height: getVerticalSize(20),
        ),
        ChooseReviewOption(
          value: 'Bad',
          groupValue: groupReviewOptionValue,
          onChanged: _reviewChangedHandler(),
        ),
        SizedBox(
          height: getVerticalSize(20),
        ),
        ChooseReviewOption(
          value: 'Worst',
          groupValue: groupReviewOptionValue,
          onChanged: _reviewChangedHandler(),
        ),
        SizedBox(
          height: getVerticalSize(30),
        ),
        GeneralElevatedButton(
          onPressed: onPressed,
          buttonTitle: 'Submit',
        ),
      ],
    );
  }
}
