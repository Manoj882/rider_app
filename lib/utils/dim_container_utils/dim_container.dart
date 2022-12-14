import 'package:flutter/material.dart';

class DimContainer extends StatelessWidget {
  const DimContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.black54.withOpacity(0.55),
        height: double.maxFinite,
        width: double.maxFinite,
      ),
    );
  }
}