import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:la_plaza_app/properties/own_colors.dart';


class LoadingWidget extends StatefulWidget {
  LoadingWidget();
  @override
  _LoadingWidget createState() => _LoadingWidget();
}

class _LoadingWidget extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(OwnColors.mainGreen),
        ),
      ),
      color: Colors.white.withOpacity(0.8),
    );

  }

}
