import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_plaza_app/properties/own_colors.dart';


class PasswordInput extends StatefulWidget {
  TextEditingController controllerEmail;
  Color backgroudColor;
  Color shadowColor;
  bool seePassword;
  PasswordInput({Key key,  this.controllerEmail, this.backgroudColor, this.shadowColor, this.seePassword});
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroudColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
          padding: EdgeInsets.all(10),
          //color: Colors.blue,
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: TextField(
                  controller: widget.controllerEmail,
                  obscureText: widget.seePassword,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold
                  ),
                  cursorColor: OwnColors.mainBlue,
                  decoration: InputDecoration(
                      hintText:"Contraseña",
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
                ),
              ),
              Expanded(
                  flex: 1,
                  child: IconButton(
                      icon: Icon(
                        widget.seePassword ? Icons.remove_red_eye_outlined:Icons.remove_red_eye,
                        color: OwnColors.mainBlue,
                        size: 30),
                      onPressed: (){
                          setState(() {
                            if(widget.seePassword){widget.seePassword=false;}
                            else{widget.seePassword=true;}
                          });
                      })
              )
            ],
          )
      ),
    );

  }
}
