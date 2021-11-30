import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:la_plaza_app/bloc/blocUser.dart';
import 'package:la_plaza_app/controllers/ClientController.dart';
import 'package:la_plaza_app/properties/own_colors.dart';
import 'package:la_plaza_app/ui/pages/home_controller.dart';

class NewUserValidationPage extends StatefulWidget {
  ClientController clientController;
  NewUserValidationPage({Key key, this.clientController});
  @override
  _NewUserValidationPageState createState() => _NewUserValidationPageState();
}

class _NewUserValidationPageState extends State<NewUserValidationPage> {
  UserBloc userBloc;
  bool loading;
  @override
  void initState() {
    setState(() {
      this.loading=true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userBloc= BlocProvider.of(context);
    if(this.loading){
      this.userBloc.authUser(widget.clientController.getEmail(), widget.clientController.getPassword()).then((userId){
        widget.clientController.setId(userId);
        this.userBloc.registerUserInDB(widget.clientController.user).then((value){
          setState(() {
            this.loading=false;
            print("¡¡¡User created!!");
          });
        });
      });
    }
    return WillPopScope(
      onWillPop: () async=>false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: OwnColors.greyBackground,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          leading: Container(
            color: OwnColors.greyBackground,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.arrow_forward,
                color: (this.loading)?OwnColors.greyBackground:Colors.black,
                size: 30,
              ),
              onPressed: (){
                if(!this.loading){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeController(userId: widget.clientController.getId())));
                }
              },
            ),
          ],
        ),
        body: Container(
          color: OwnColors.greyBackground,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                  flex: 2,
                  child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return ScaleTransition(child: child, scale: animation);
                      },
                      child: loading ?
                      Container(
                        key: UniqueKey(),
                        //color: Colors.purple,
                        child: Center(
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 2,
                                  child:  Container(
                                    width: 170,
                                    height: double.infinity,
                                    //color: Colors.green,
                                    child: CircularProgressIndicator(
                                      valueColor: new AlwaysStoppedAnimation<Color>(OwnColors.mainBlue),
                                      strokeWidth: 11,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    //color: Colors.yellow,
                                    child: Text(
                                        "Creando usuario...",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 25,
                                            color: OwnColors.mainGreen,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                              ],
                            )
                        ),
                      )
                          :
                      Container(
                          key: UniqueKey(),
                          child: Container(
                              child: Center(
                                child: Text(
                                  "¡Listo!",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                          )
                      )
                  )
              ),
              Expanded(
                flex: 1,
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}


