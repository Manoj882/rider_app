import 'dart:html';

import 'package:flutter/material.dart';
import 'package:rider_app/screens/riders/trip_request_page.dart';

class CustomPopupRoute extends PopupRoute<void> {
  Widget? widget;
  @override
  Color get barrierColor => Colors.black54;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => 'Close';

  @override
  Widget buildPage(
    BuildContext context, 
    Animation<double>? animation,
    Animation<double>? secondaryAnimation,
    
    ) {
    return DisplayFeatureSubScreen(
      anchorPoint: Offset.infinite,
      child: widget!,
    );
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);
}
