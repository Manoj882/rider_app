import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';

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
  ];

    List<DropdownMenuItem<String>> getVehicle(){
      return vehicles.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList();
    }

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
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
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          
          child: DropdownButton<String>(
            items: getVehicle(),
            onChanged: (newValue) {
              setState(() {
                selectedValue = newValue!;
                widget.function(newValue);
              });
            },
            hint: const Text('Car'),
            value: selectedValue,
            isExpanded: true,
            underline: const SizedBox(),
          ),
        ),
      ),
    );
  }
}
