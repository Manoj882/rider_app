import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';

class GeneralDropDown extends StatefulWidget {
  const GeneralDropDown(this.function,{super.key});

  final Function(String) function;

  @override
  State<GeneralDropDown> createState() => _GeneralDropDownState();
}

class _GeneralDropDownState extends State<GeneralDropDown> {
  final List<DropdownMenuItem<String>> list = [
    const DropdownMenuItem(
      child: Text('Bike'),
      value: 'Bike',
    ),
    const DropdownMenuItem(
      child: Text('Scooter'),
      value: 'Scooter',
    ),
    const DropdownMenuItem(
      child: Text('Car'),
      value: 'Car',
    ),
  ];

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
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16,),
          child: DropdownButton<String>(
            items: list,
            onChanged: (value){
              setState(() {
                selectedValue = value!;
                widget.function(value);
              });
            },
            hint: const Text('Bike / Scooter'),
            value: selectedValue,
            isExpanded: true,
            underline: const SizedBox(),
          ),
        ),
      ),
    );
  }
}
