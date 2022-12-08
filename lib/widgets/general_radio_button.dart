import 'package:flutter/material.dart';
import 'package:rider_app/constants/colors_constant.dart';

class GeneralRadioButton extends StatefulWidget {
  const GeneralRadioButton(this.function, {super.key});

  final Function(String) function;
  

  @override
  State<GeneralRadioButton> createState() => _GeneralRadioButtonState();
}

class _GeneralRadioButtonState extends State<GeneralRadioButton> {
  late String groupingValue;

  @override
  void initState() {
    super.initState();
    groupingValue = 'Rides';
    widget.function(groupingValue);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        getRadio('Rides',ColorsConstant.radioColor1),
        Text(
          'Rides',
          style: TextStyle(color: ColorsConstant.radioColor1),
        ),
        getRadio('Earnings', ColorsConstant.radioColor2),
        Text(
          'Earnings',
          style: TextStyle(color: ColorsConstant.radioColor2),
        ),
      ],
    );
  }

  Widget getRadio(String value, Color color) {
    return Radio<String>(
      value: value,
      groupValue: groupingValue,
      fillColor:
        MaterialStateColor.resolveWith((states) => color),
      onChanged: (value) {
        setState(() {
          groupingValue = value.toString();
        });
        widget.function(value!);
      },
    );
  }
}
