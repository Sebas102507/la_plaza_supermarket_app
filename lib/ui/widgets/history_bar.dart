import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_plaza_app/properties/own_colors.dart';
class HistoryBar extends StatefulWidget {
  HashSet<String> history;
  Function(String) onTap;
  HistoryBar({Key key,this.history,this.onTap});

  @override
  _HistoryBarState createState() => _HistoryBarState();
}

class _HistoryBarState extends State<HistoryBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(
                  left: 20,
                  right: 20
              ),
              color: Colors.white.withOpacity(0.95),
              child: ListView.builder(
                itemCount: widget.history.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: InkWell(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.history,
                                      color: OwnColors.mainBlue.withOpacity(0.5),
                                      size: 33,
                                    )
                                )
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.history.elementAt(index),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: OwnColors.mainBlue.withOpacity(0.5),

                                    ),
                                  ),
                                )
                            ),
                          ),

                        ],
                      ),
                      onTap: (){
                        widget.onTap(widget.history.elementAt(index));
                      },
                    )
                  );
                },
              )
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(),
          ),
        ],
      ),
    );
  }
}