import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/constants/strings_constant.dart';
import 'package:rider_app/models/dashboard_model.dart';
import 'package:rider_app/utils/sliver_appbar/general_sliver_app_bar.dart';
import 'package:rider_app/utils/form_field_utils/size_utils.dart';
import 'package:rider_app/widgets/dropdown_widgets/filter_dashboard_dropdown.dart';
import 'package:rider_app/widgets/custom_elevated_button_widget/general_elevated_button.dart';
import 'package:rider_app/widgets/radio_button_widget/general_radio_button.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String filterValue = 'Weeky';
  String radioButtonValue = 'Rides';
  changeFilterValue(String value) {
    setState(() {
      filterValue = value;
    });
  }

  changeRadioButtonValue(String value) {
    radioButtonValue = value;
  }

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            GeneralSliverAppBar(appBarTitle: StringsConstant.dashboard),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: getVerticalSize(8),
                horizontal: getHorizontalSize(16),
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: getVerticalSize(50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FilterDashboardDropDown(changeFilterValue),
                                Container(
                                  height: getVerticalSize(40),
                                  width: getHorizontalSize(63),
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(220, 20, 60, 0.15),
                                    borderRadius: BorderRadius.circular(
                                        getVerticalSize(30)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '+2.5 %',
                                      style: TextStyle(
                                        color: ColorsConstant.primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(10),
                          ),
                          Container(
                            child: Image.asset('assets/images/graph.PNG'),
                          ),
                          SizedBox(
                            height: getVerticalSize(10),
                          ),
                          Container(
                            height: getVerticalSize(20),
                            child: GeneralRadioButton(changeRadioButtonValue),
                          ),
                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                          Text(
                            'Analytics',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SizedBox(
                            height: getVerticalSize(10),
                          ),
                          Container(
                            color: ColorsConstant.white,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: listOfDashboardData.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: getVerticalSize(1),
                                crossAxisSpacing: getHorizontalSize(20),
                                mainAxisExtent: getVerticalSize(120),
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: getGridViewContainer(
                                    model: listOfDashboardData[index],
                                    index: index,
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(10),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'Pay you',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                SizedBox(
                                  width: getHorizontalSize(5),
                                ),
                                Text(
                                  'Fare',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                        color: ColorsConstant.primary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(10),
                          ),
                          Container(
                            child: Text(
                              'Note: If fare amount exceed more than Rs. 1000 then you won\'t be able to go online and start using our service.',
                              textAlign: TextAlign.justify,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                          GeneralElevatedButton(
                            onPressed: () {},
                            buttonTitle: 'Pay',
                          ),
                          SizedBox(
                            height: getVerticalSize(20),
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

  Widget getGridViewContainer(
      {required DashboardModel model, required int index}) {
    return Column(
      children: [
        Container(
          height: getVerticalSize(100),
          width: getHorizontalSize(177),
          padding: EdgeInsets.only(left: getHorizontalSize(20)),
          decoration: BoxDecoration(
            color: ColorsConstant.containerColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: ColorsConstant.analyticsColor,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              SizedBox(
                height: getVerticalSize(10),
              ),
              Text(
                model.value.toString(),
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: ColorsConstant.analyticsColor,
                    ),
              ),
            ],
          ),
        ),
        selectedIndex == index
            ? Divider(
                thickness: 3,
                color: ColorsConstant.primary,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
