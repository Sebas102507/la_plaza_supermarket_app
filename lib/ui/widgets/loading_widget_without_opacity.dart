import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:la_plaza_app/properties/own_colors.dart';


class LoadingWidgetWithoutOpacity extends StatefulWidget {
  LoadingWidgetWithoutOpacity();
  @override
  _LoadingWidgetWithoutOpacity createState() => _LoadingWidgetWithoutOpacity();
}

class _LoadingWidgetWithoutOpacity extends State<LoadingWidgetWithoutOpacity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(OwnColors.mainGreen),
        ),
      ),
      color: OwnColors.greyBackground
    );

  }

}