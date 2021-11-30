import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_plaza_app/ui/widgets/OwnIcons.dart';
class AddToKartButton extends StatefulWidget {
  String title;
  Color backgroundColor;
  Color titleColor;
  Function onPressed;
  AddToKartButton({Key key, this.title,this.backgroundColor,this.titleColor,this.onPressed});

  @override
  _AddToKartButtonState createState() => _AddToKartButtonState();
}

class _AddToKartButtonState extends State<AddToKartButton> {
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
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Icon(
                      OwnIcons.shopping_basket,
                      color: Colors.white,
                      size: 30,
                    )
                ),
                Expanded(
                  flex: 2,
                  child:  Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: widget.titleColor
                      )
                  ),
                ),
              ],
            )
          )
      ),
    );
  }
}