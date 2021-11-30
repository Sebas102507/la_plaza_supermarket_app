import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfigurationOption extends StatelessWidget {
  String title;
  Color titleColor;
  VoidCallback onTap;
  IconData icon;
  ConfigurationOption({Key key,  this.title,this.titleColor,  this.onTap, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: InkWell(
          onTap: this.onTap,
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this.title,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: this.titleColor
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      this.icon,
                      color: this.titleColor,
                      size: 25,
                    )
                ),
              )
            ],
          )
      ),
    );
  }
}
