import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';

class FilterDashboardDropDown extends StatefulWidget {
  const FilterDashboardDropDown(this.function,{super.key});

  final Function(String) function; 

  @override
  State<FilterDashboardDropDown> createState() =>
      _FilterDashboardDropDownState();
}

class _FilterDashboardDropDownState extends State<FilterDashboardDropDown> {
  List<String> filterDashboard = ['Weekly', 'Monthly', 'Yearly'];

  List<DropdownMenuItem<String>> getFilter() {
    return filterDashboard.map<DropdownMenuItem<String>>((String filterValue) {
      return DropdownMenuItem<String>(
        value: filterValue,
        child: Text(filterValue),
      );
    }).toList();
  }

  String? selectedFilterValue;


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: ColorsConstant.fliterContainer,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: DropdownButton<String>(
            items: getFilter(),
              onChanged: (newValue) {
                setState(() {
                  selectedFilterValue = newValue!;
                  widget.function(newValue);
                
                  
                });
              },
              hint: const Text('Weekly'),
              value:  selectedFilterValue,
              underline: const SizedBox(),
            
            ),
        ),
        
      );
  }
}
