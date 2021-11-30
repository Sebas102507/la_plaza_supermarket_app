import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_plaza_app/bloc/blocUser.dart';
import 'package:la_plaza_app/properties/own_colors.dart';
import 'package:la_plaza_app/ui/widgets/configuration_option.dart';




class ConfigurationPage extends StatefulWidget {
  ConfigurationPage({Key key});
  @override
  _ConfigurationPage createState() => _ConfigurationPage();
}

class _ConfigurationPage extends State<ConfigurationPage> {
  UserBloc userBloc;
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
    userBloc= BlocProvider.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: OwnColors.greyBackground,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: OwnColors.greyBackground,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        // color: Colors.purple,
                      ),
                    ),

                    Expanded(
                      flex: 3,
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
                                  child: Center(
                                    child: Text(
                                      "Configuración",
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
                      flex: 1,
                      child: Container(
                        //color: Colors.red
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                //color: Colores.fondoGrisClaro,
                //color: Colors.blue,
                padding: EdgeInsets.only(
                    left: 10,
                    right: 10
                ),
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: ConfigurationOption(
                          title: "Mi perfil",
                          titleColor: Colors.grey,
                          icon: Icons.arrow_forward,
                          onTap: (){

                          },
                        )
                    ),

                    Expanded(
                        flex: 1,
                        child: ConfigurationOption(
                          title: "Historial de pedidos",
                          titleColor: Colors.grey,
                          icon: Icons.arrow_forward,
                          onTap: (){
                          },
                        )
                    ),
                    Expanded(
                      flex: 1,
                      child: ConfigurationOption(
                        title: "Términos y condiciones",
                        titleColor: Colors.grey,
                        icon: Icons.arrow_forward,
                        onTap: (){
                        },
                      )
                    ),
                    Expanded(
                        flex: 1,
                        child: ConfigurationOption(
                          title: "Cerrar sesión",
                          icon: Icons.logout,
                          titleColor: Colors.redAccent,
                          onTap: (){
                            print("Cerrar sesión");
                            this.userBloc.signOut().then((value){
                              Navigator.pop(context);
                              Navigator.pop(context);
                            });
                          },
                        )
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                //color: Colors.orange,
              ),
            )
          ],
        ),
      ),
    );
  }
}