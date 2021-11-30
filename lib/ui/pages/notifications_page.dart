import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_plaza_app/properties/own_colors.dart';
import 'package:la_plaza_app/ui/widgets/loading_widget.dart';


class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool loading=false;
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: OwnColors.mainBlue,
        statusBarIconBrightness: Brightness.light
    ));
    return  SafeArea(
      child: Container(
          color: OwnColors.greyBackground,
          child: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        //color: Colors.green,
                          padding: EdgeInsets.only(
                              left: 10,
                              right: 15,
                              bottom:15
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  //color: Colors.blue,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  //color: Colors.brown,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "Notificaciones",
                                      style: GoogleFonts.poppins(
                                          fontSize: 32,
                                          color: OwnColors.mainBlue,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  //color: Colors.blue,
                                ),
                              )
                            ],
                          )
                      ),
                    ),
                    Expanded(
                        flex: 16,
                        child: Container(
                          child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 50,
                                      right: 50
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Actualmente no tienes notificaciones.",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  //color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
              Positioned(
                child: loading
                    ? LoadingWidget()
                    : Container(),
              ),
            ],
          )
      ),
    );
  }
}