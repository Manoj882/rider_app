import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';
import 'package:rider_app/widgets/custom_elevated_button_widget/general_elevated_button.dart';

class GeneralDateFilterButtomSheet {
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  // DateTime now = DateTime.now();
  String currentDate = DateFormat.yMMMd().format(DateTime.now());

  customFilterButtomSheet(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            getVerticalSize(30),
          ),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getHorizontalSize(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getVerticalSize(30),
                ),
                Text(
                  'Date Filter',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildDateContainer(
                      context,
                      dateTitle: 'From',
                      hintText: currentDate,
                      controller: fromDateController,
                    ),
                    buildDateContainer(
                      context,
                      dateTitle: 'To',
                      hintText: currentDate,
                      controller: toDateController,
                    ),
                  ],
                ),
                SizedBox(
                  height: getVerticalSize(30),
                ),
                GeneralElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  buttonTitle: 'Apply',
                ),
                SizedBox(
                  height: getVerticalSize(30),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  buildDateContainer(
    BuildContext context, {
    required String dateTitle,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getVerticalSize(30),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            dateTitle,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Container(
          height: getVerticalSize(60),
          width: getHorizontalSize(170),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              getVerticalSize(30),
            ),
          ),
          child: TextFormField(
            controller: controller,
            readOnly: true,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: getHorizontalSize(10),
                vertical: getVerticalSize(20),
              ),
              fillColor: Colors.green,
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyText1,
              prefixIconConstraints: BoxConstraints(
                minHeight: getVerticalSize(25),
                minWidth: getHorizontalSize(25),
              ),
              prefixIcon: Container(
                padding: EdgeInsets.only(
                  top: getVerticalSize(15),
                  bottom: getVerticalSize(15),
                  left: getHorizontalSize(20),
                  right: getHorizontalSize(10),
                ),
                child: SvgPicture.asset(
                  'assets/images/img_bag.svg',
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: getHorizontalSize(1),
                  color: ColorsConstant.borderColor,
                ),
                borderRadius: BorderRadius.circular(
                  getVerticalSize(30),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: getHorizontalSize(1),
                  color: ColorsConstant.borderColor,
                ),
                borderRadius: BorderRadius.circular(
                  getVerticalSize(30),
                ),
              ),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: ColorsConstant.primary,
                        ),
                      ),
                      child: child!,
                    );
                  });
              if (pickedDate != null) {
                String formattedDate = DateFormat.yMMMd().format(pickedDate);
                controller.text = formattedDate;
              } else {}
            },
          ),
        ),
      ],
    );
  }
}
