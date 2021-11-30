import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:la_plaza_app/bloc/blocUser.dart';
import 'package:la_plaza_app/controllers/ControllerToastMenssages.dart';
import 'package:la_plaza_app/properties/own_colors.dart';
import 'package:la_plaza_app/ui/pages/home_controller.dart';
import 'package:la_plaza_app/ui/widgets/generic_input_widget.dart';
import 'package:la_plaza_app/ui/widgets/loading_widget.dart';
import 'package:la_plaza_app/ui/widgets/password_input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final controllerPassword = TextEditingController();
  final controllerEmail = TextEditingController();
  bool loading;
  UserBloc userBloc;
  @override
  void initState() {
    setState(() {
      this.loading=false;
    });
    super.initState();
  }

  @override
  void dispose() {
    controllerPassword.dispose();
    this.controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userBloc= BlocProvider.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: OwnColors.greyBackground,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: OwnColors.mainBlue),
          elevation: 0,
        ),
        body: Stack(
          children: [
            SafeArea(
              child: Container(
                color: OwnColors.greyBackground,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        //color: Colors.blue,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          child: Text(
                              "Iniciar Sesión",
                              style: GoogleFonts.montserrat(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: OwnColors.mainBlue
                              )
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        //color: Colors.blue,
                          padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 20,
                              bottom: 20
                          ),
                          child: Column(
                            children: [
                              GenericInput(controller: this.controllerEmail,backgroudColor: Colors.white,shadowColor: Colors.grey,title: "Correo",enable: true),
                              Divider(color: Colors.white,height: 25,),
                              PasswordInput(controllerEmail: this.controllerPassword,backgroudColor: Colors.white,shadowColor: Colors.grey,seePassword: true,)
                            ],
                          )
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        //color: Colors.greenAccent,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                bottom: 55
                            ),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:OwnColors.mainBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onPressed: (){
                                  if(controllerPassword.text.length==0 || controllerEmail.text.length==0){
                                   ControllerToastMessages.invalidEmailorPassword();
                                  }else{
                                    setState(() {this.loading=true;});
                                    this.userBloc.checkIfUserExistsInDB(this.controllerEmail.text, null).then((exists){
                                      setState(() {this.loading=false;});
                                      if(exists){
                                          this.userBloc.authEntry(this.controllerEmail.text, this.controllerPassword.text).then((userId){
                                            if(userId==null){
                                             ControllerToastMessages.invalidPassword();
                                            }else{
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeController(userId: userId)));
                                            }
                                          });
                                      }else{
                                        ControllerToastMessages.emailAlreadyExists();
                                      }
                                    });
                                  }
                                },

                                child: Center(
                                  child: Text(
                                      "Continuar",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          color: Colors.grey[300]
                                      )
                                  ),
                                )
                            ),
                          )
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              child: loading
                  ? LoadingWidget()
                  : Container(),
            ),
          ],
        )
    );
  }
}
