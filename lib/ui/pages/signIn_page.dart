import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:la_plaza_app/bloc/blocUser.dart';
import 'package:la_plaza_app/controllers/ClientController.dart';
import 'package:la_plaza_app/controllers/ControllerToastMenssages.dart';
import 'package:la_plaza_app/properties/own_colors.dart';
import 'package:la_plaza_app/ui/pages/new_user_validation_page.dart';
import 'package:la_plaza_app/ui/widgets/generic_input_widget.dart';
import 'package:la_plaza_app/ui/widgets/loading_widget.dart';
import 'package:la_plaza_app/ui/widgets/main_button.dart';
import 'package:la_plaza_app/ui/widgets/password_input.dart';




class SignInPage extends StatefulWidget {
  @override
  _SignInPage createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  final controllerPassword = TextEditingController();
  final controllerEmail = TextEditingController();
  UserBloc userBloc;
  bool loading;
  ClientController clientController;
  @override
  void initState() {
    clientController= new ClientController();
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
                              "Crea tu cuenta",
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
                                bottom: 50
                            ),
                            child: MainButton(
                              backgroundColor: OwnColors.mainBlue,
                              titleColor: Colors.grey[300],
                              title: "Continuar",
                              onPressed: (){
                               try{
                                  clientController.createClientWithEmailAndPassword(controllerEmail.text, controllerPassword.text);
                                  setState(() {this.loading=true;});
                                  this.userBloc.checkIfUserExistsInDB(this.controllerEmail.text, "").then((existe){
                                    setState(() {this.loading=false;});
                                    if(existe){
                                     ControllerToastMessages.emailAlreadyExists();
                                    }else{
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NewUserValidationPage(clientController: this.clientController)));
                                    }
                                  });
                                }catch(e){
                                  Fluttertoast.showToast(
                                      msg: e.toString().substring(11),
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.grey,
                                      timeInSecForIosWeb: 2);
                                }
                              },
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

