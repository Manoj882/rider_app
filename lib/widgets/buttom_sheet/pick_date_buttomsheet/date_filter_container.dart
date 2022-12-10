import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/utils/form_field_utils/size_utils.dart';
import 'package:rider_app/widgets/buttom_sheet/pick_date_buttomsheet/general_date_buttomsheet.dart';
import 'package:rider_app/widgets/buttom_sheet/general_buttom_sheet.dart';

class DateFilterContainer extends StatefulWidget {
  const DateFilterContainer({super.key});

  @override
  State<DateFilterContainer> createState() => _DateFilterContainerState();
}

class _DateFilterContainerState extends State<DateFilterContainer> {
  List<String> listDays = ['7 days', '15 days', '30 days', '6 month', '1 year'];
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 11,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getVerticalSize(8)),
                child: Container(
                  height: getVerticalSize(50),
                  decoration: BoxDecoration(
                    color: ColorsConstant.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics:
                              const BouncingScrollPhysics(),
                          itemCount: listDays.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: getPadding(
                                  left: getHorizontalSize(0),
                                  top: getVerticalSize(8),
                                  bottom: getVerticalSize(8),
                                  right: getHorizontalSize(8)),
                              child: Container(
                                padding: EdgeInsets.all(
                                    getVerticalSize(8)),
                                decoration: BoxDecoration(
                                  color: ColorsConstant
                                      .containerColor,
                                  borderRadius:
                                      BorderRadius.circular(
                                          getVerticalSize(
                                              3)),
                                ),
                                height: getVerticalSize(20),
                                width:
                                    getHorizontalSize(70),
                                child: Text(
                                  listDays[index],
                                  textAlign:
                                      TextAlign.center,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  GeneralDateFilterButtomSheet().customFilterButtomSheet(context);
                },
                child: SvgPicture.asset(
                    'assets/images/img_computer.svg'),
              ),
            ),
          ],
        ),
      );
  }
}