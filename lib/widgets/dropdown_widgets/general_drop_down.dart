import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';
import 'package:rider_app/utils/size_utils/size_utils.dart';

class GeneralDropDown extends StatefulWidget {
  const GeneralDropDown(this.function, {super.key});

  final Function(String) function;

  @override
  State<GeneralDropDown> createState() => _GeneralDropDownState();
}

class _GeneralDropDownState extends State<GeneralDropDown> {
  
  List<String> vehicles = [
    'Bike',
    'Car',
    'Scooter',
    'Taxi',
  ];

    List<DropdownMenuItem<String>> getVehicle(){
      return vehicles.map<DropdownMenuItem<String>>((String value ) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList();
    }

  String selectedValue = 'Bike';
 
 


  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(60),
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: ColorsConstant.borderColor,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getVerticalSize(8),
            horizontal: getHorizontalSize(16),
          ),
          
          child: DropdownButton<String>(
            items: getVehicle(),
            
            onChanged: (newValue) {
              setState(() {
               
                selectedValue = newValue.toString();
                widget.function(newValue.toString());
               
              });
            },
          
            hint: const Text('Car'),
            value:selectedValue,
            isExpanded:true,
            underline: const SizedBox(),
          ),
        ),
      ),
    );
  }
}
