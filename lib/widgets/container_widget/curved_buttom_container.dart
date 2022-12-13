import 'package:flutter/material.dart';

class CurvedButtomContainer extends StatelessWidget {
  const CurvedButtomContainer({
    required this.widget,
    super.key});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 10,
            offset: Offset(1, 0),
          ),
        ],
      ),
      child: widget,
    );
  }
}