import 'package:flutter/material.dart';

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

  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = 'Bike';
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: list,
      onChanged: (value){
        setState(() {
          selectedValue = value!;
          widget.function(value);
        });
      },
      hint: Text('Vehicle'),
      value: selectedValue,
    );
  }
}
