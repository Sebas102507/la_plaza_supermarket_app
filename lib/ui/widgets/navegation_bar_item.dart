import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_plaza_app/properties/own_colors.dart';




class NavegationBarItem extends StatelessWidget {
  IconData icon;
  String title;
  VoidCallback onTap;
  int selectedOption;
  int navegationOption;
  NavegationBarItem({Key key, this.onTap,this.title,this.icon,this.navegationOption,this.selectedOption});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    //color: Colors.blue,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Icon(
                          this.icon,
                          color: this.navegationOption==this.selectedOption ? OwnColors.mainGreen:Colors.grey,
                          size: 20,
                        ),
                      )
                  )
              ),
              Expanded(
                flex: 1,
                child: Text(
                  this.title,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: this.navegationOption==this.selectedOption ? OwnColors.mainGreen:Colors.grey,
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
