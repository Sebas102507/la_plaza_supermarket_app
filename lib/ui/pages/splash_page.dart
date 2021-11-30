import 'package:flutter/material.dart';
import 'package:la_plaza_app/properties/own_colors.dart';

class SplashPage extends StatelessWidget{
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: OwnColors.greyBackground,
        child:  Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/LaPlazaLogo.png")
                )
            ),
          ),
        ),
      )
    );
  }
}
