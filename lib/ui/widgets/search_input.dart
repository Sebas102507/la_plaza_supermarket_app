import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_plaza_app/properties/own_colors.dart';



class SearchInput extends StatelessWidget {

  TextEditingController controller;
  Color backgroundColor;
  Color shadowColor;
  String title;
  Function(String) onChanged;
  Function(String) onSummited;
  Function onTap;
  SearchInput ({Key key,  this.controller, this.backgroundColor, this.shadowColor, this.title, this.onChanged,this.onSummited,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
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
          child: TextField(

            controller: controller,
            style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.black54,
            ),
            cursorColor: OwnColors.mainBlue,
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.search,
                color: Colors.grey[400],
                size: 35,
              ),
              hintText: this.title,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.grey
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: this.backgroundColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: this.backgroundColor),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: this.backgroundColor),
              ),
            ),
            onChanged: this.onChanged,
            onSubmitted: this.onSummited,
            onTap: this.onTap,

          )
      ),
    );

  }

}