import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_plaza_app/properties/own_colors.dart';



class GenericInput extends StatelessWidget {

  TextEditingController controller;
  Color backgroudColor;
  Color shadowColor;
  String title;
  bool enable;
  GenericInput({Key key,  this.controller, this.backgroudColor, this.shadowColor, this.title, this.enable});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.backgroudColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
       boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
          padding: EdgeInsets.all(10),
          //color: Colors.blue,
          child: TextFormField(
            enabled: this.enable,
            controller: controller,
            style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.grey[400],
                fontWeight: FontWeight.bold
            ),
            cursorColor: OwnColors.mainBlue,
            decoration: InputDecoration(

              hintText: this.title,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.grey
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: OwnColors.mainBlue),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: OwnColors.mainBlue),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: OwnColors.mainBlue),
              ),
            ),
          )
      ),
    );

  }

}
