import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:la_plaza_app/bloc/blocUser.dart';
import 'package:la_plaza_app/controllers/ClientController.dart';
import 'package:la_plaza_app/models/client.dart';
import 'package:la_plaza_app/properties/own_colors.dart';
import 'package:la_plaza_app/ui/pages/configuration_page.dart';
import 'package:la_plaza_app/ui/pages/home.dart';
import 'package:la_plaza_app/ui/pages/notifications_page.dart';
import 'package:la_plaza_app/ui/pages/orders_page.dart';
import 'package:la_plaza_app/ui/widgets/navegation_bar.dart';




class HomeController extends StatefulWidget {
  String userId;
  HomeController({Key key, this.userId});
  @override
  _HomeController createState() => _HomeController();
}

class _HomeController extends State<HomeController>{
  UserBloc userBloc;
  int opcionNavegacion=0;
  ClientController _clientController;
  @override
  Widget build(BuildContext context) {
    userBloc= BlocProvider.of(context);
    return WillPopScope(
      onWillPop: () async=>false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("users").doc(widget.userId).snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(!snapshot.hasData || snapshot.hasError){
                return Container();
              }
              else{
                this._clientController= new ClientController();
                Client usuarioActual=new Client.ExistingUser(snapshot.data["email"], snapshot.data["id"]);
                this._clientController.setUser(usuarioActual);
                return Container(
                  color: OwnColors.greyBackground,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 22,
                          child: this.screensController(usuarioActual)
                      ),
                      Expanded(
                          flex: 2,
                          child: NavegationBar(
                            onTapHome: (){
                              setState(() {this.opcionNavegacion=0;});
                            },
                            onTapMyNotifications: (){
                              setState(() {this.opcionNavegacion=1;});
                            },
                            onTapOrders: (){
                              setState(() {this.opcionNavegacion=2;});
                            },
                            onTapConfig: (){
                              setState(() {this.opcionNavegacion=3;});
                            },
                            selectedOption: this.opcionNavegacion,
                          )
                      )
                    ],
                  ),
                );
              }
            },
          )
        )
      ),
    );
  }
  Widget screensController(Client currentClient){
    if(this.opcionNavegacion==0){
      return Home(clientController: this._clientController);
    }else if(this.opcionNavegacion==1){
      return NotificationsPage();
    }else if(this.opcionNavegacion==2){
      return OrdersPage();
    }else{
      return ConfigurationPage();
    }
  }
}

