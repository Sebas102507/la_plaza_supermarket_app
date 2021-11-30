import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MainButton extends StatefulWidget {
  String title;
  Color backgroundColor;
  Color titleColor;
  Function onPressed;
  MainButton({Key key, this.title,this.backgroundColor,this.titleColor,this.onPressed});

  @override
  _MainButtonState createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: widget.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: widget.onPressed,
          child: Center(
            child: Text(
                widget.title,
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: widget.titleColor
                )
            ),
          )
      ),
    );
  }
}
