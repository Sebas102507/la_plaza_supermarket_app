import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_plaza_app/controllers/ControllerToastMenssages.dart';
import 'package:la_plaza_app/controllers/Product_controller.dart';
import 'package:la_plaza_app/properties/own_colors.dart';
import 'package:la_plaza_app/ui/widgets/OwnIcons.dart';
import 'package:la_plaza_app/ui/widgets/add_to_kart_button.dart';

class ProductInfoPage extends StatefulWidget {
  ProductController productController;
  ProductInfoPage({Key key,this.productController});
  @override
  _ProductInfoPageState createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  int selectedUnits=1;
  bool likeButton;

  @override
  void initState() {
    super.initState();
    likeButton=false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: OwnColors.greyBackground,
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: OwnColors.mainBlue),
        elevation: 0,
      ),
      body:  Container(
        color: OwnColors.greyBackground,
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(60),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: CachedNetworkImageProvider(widget.productController.getImage()),
                        )
                    ),
                  ),
                ),
              ),

            Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 15,
                    right: 15
                  ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)
                        ),
                    ),
                    padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      top: 15,

                    ),
                    width: double.infinity,
                    //color: Colors.greenAccent,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child:  Container(
                                      width: double.infinity,
                                      //color: Colors.yellow,
                                      child:Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          widget.productController.getName(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              color: OwnColors.mainBlue,
                                              fontWeight: FontWeight.bold
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      )
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: InkWell(
                                        child: Icon(
                                          likeButton?OwnIcons.heart:OwnIcons.heart_outline,
                                          color: likeButton?Colors.red:Colors.blueGrey,
                                          size: 30,
                                        ),
                                        onTap: (){
                                          setState(() {
                                            if(likeButton){
                                              this.likeButton=false;
                                            }else{
                                              this.likeButton=true;
                                            }
                                          });
                                        },
                                      ),
                                    )
                                ),
                              ],
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                                width: double.infinity,
                                //color: Colors.blue,
                                child:Align(
                                  alignment: Alignment.topLeft,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      widget.productController.getDescription(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: OwnColors.mainBlue.withOpacity(0.8),
                                        //fontWeight: FontWeight.bold
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  )
                                )
                            )
                        ),

                        Expanded(
                          flex: 1,
                          child: Container(
                            //color: Colors.greenAccent,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "\$${(this.selectedUnits*widget.productController.getPrice()).toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},')}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Colors.redAccent,
                                    decoration: TextDecoration.lineThrough
                                  //fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            // color: Colors.greenAccent,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "\$${(this.selectedUnits*widget.productController.getPrice()*(1-widget.productController.getDiscount()/100)).toInt().toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},')} COP",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: OwnColors.mainGreen,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child:Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: IconButton(
                                                    icon: Icon(Icons.keyboard_arrow_down_sharp,color: OwnColors.mainBlue,size: 30,),
                                                    onPressed: (){
                                                      if(this.selectedUnits>1){
                                                        setState(() {
                                                          this.selectedUnits--;
                                                        });
                                                      }
                                                      print("RESTAR");
                                                    }
                                                )
                                            )
                                        ),
                                      ),

                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                            //color: Colors.purple,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${this.selectedUnits}",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                color: OwnColors.mainBlue
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          )
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          //color: Colors.red,
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: IconButton(
                                                    icon: Icon(Icons.keyboard_arrow_up,color: OwnColors.mainBlue,size: 30,),
                                                    onPressed: (){
                                                      if(this.selectedUnits<widget.productController.getLimitUnits()){
                                                        setState(() {
                                                          this.selectedUnits++;
                                                        });
                                                      }
                                                      print("SUMAR");
                                                    }
                                                )
                                            )
                                        ),
                                      ),
                                    ],
                                  )
                                )
                            )
                        ),

                        Expanded(
                            flex: 2,
                            child: Container(
                                width: double.infinity,
                                //color: Colors.red,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                        child: Container(
                                          //color: Colors.brown,
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                              top: 15,
                                              bottom: 15,
                                              left: 18,
                                            right: 18

                                          ),
                                          child: AddToKartButton(
                                            backgroundColor: OwnColors.mainGreen,
                                            titleColor: Colors.white,
                                            title: "Añadir al carrito",
                                            onPressed: (){
                                              ControllerToastMessages.confirmAddToKart();
                                              Navigator.pop(context);
                                            },
                                          ),
                                        )
                                    ),

                                  ],
                                )
                                )
                            ),
                        Expanded(
                            flex: 1,
                            child: Container(
                                width: double.infinity,
                                //color: Colors.yellow,
                            )
                        ),
                      ],
                    )
                )
            ),
          ],
        ),
      ),
    );

  }
}
