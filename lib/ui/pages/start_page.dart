import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:la_plaza_app/bloc/blocUser.dart';
import 'package:la_plaza_app/properties/own_colors.dart';
import 'package:la_plaza_app/ui/pages/home_controller.dart';
import 'package:la_plaza_app/ui/pages/logIn_page.dart';
import 'package:la_plaza_app/ui/pages/signIn_page.dart';
import 'package:la_plaza_app/ui/widgets/loading_widget_without_opacity.dart';
import 'package:la_plaza_app/ui/widgets/main_button.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Widget widgetActual;
  UserBloc userBloc;
  String userId;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userBloc= BlocProvider.of(context);
    return Container(
        child: StreamBuilder(
          stream: this.userBloc.authStatus,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(!snapshot.hasData || snapshot.hasError){
              return this.beginningPage();
            }
            else{
              if(this.widgetActual==null){
                this.widgetActual= LoadingWidgetWithoutOpacity();
              }
              this.userBloc.checkIfUserExistsInDB("", snapshot.data.uid).then((bool exists){
                if(exists){
                  setState(() {userId=snapshot.data.uid;});
                  setState(() {this.widgetActual=HomeController(userId: snapshot.data.uid);});
                }else{
                  setState(() {this.widgetActual=SignInPage();});
                }
              });
              return this.widgetActual;
            }

          },
        )
    );
  }

  Widget beginningPage(){
    return WillPopScope(
      onWillPop: () async=>false,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        //color: Colors.amber,
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage("assets/ImagenInicio.png")
                                                )
                                            ),
                                          ),
                                        ),
                                      )
                                    )
                                  ],
                                )
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                                padding: EdgeInsets.all(10),
                              //color: Colors.orange,
                                child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                        "Bienvenido",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: OwnColors.mainBlue
                                        )
                                    ),
                                )
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              //color: Colors.pink,
                                child: Align(
                                    alignment: Alignment.topLeft,
                                  child: Container(
                                    key: UniqueKey(),
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                        "La Plaza es la app donde puedes encontrar todo en alimentos para tu casa, carnes, verduras, frutas y mucho más.",
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            color: Colors.grey
                                        )
                                    ),
                                  ),
                                )
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      //color: Colors.red,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 25,
                                    bottom: 25
                                ),
                                child: MainButton(
                                  backgroundColor: OwnColors.mainBlue,
                                  titleColor: Colors.grey[300],
                                  title: "Iniciar sesión",
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                  },
                                ),
                              )
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              //color: Colors.greenAccent,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Todavía no tengo una cuenta  ",
                                          style: GoogleFonts.poppins(
                                            fontSize: 17,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        TextSpan(
                                            text: 'Registrarme',
                                            style: GoogleFonts.poppins(
                                                fontSize: 17,
                                                color: OwnColors.mainGreen,
                                                decoration: TextDecoration.underline
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                                              }),
                                      ]
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );

  }


}
