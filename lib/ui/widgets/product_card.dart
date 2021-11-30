import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_plaza_app/controllers/ControllerToastMenssages.dart';
import 'package:la_plaza_app/properties/own_colors.dart';
import 'package:la_plaza_app/ui/widgets/OwnIcons.dart';

class ProductCard extends StatefulWidget {
  Color shadowColor;
  String title;
  int price;
  String image;
  String category;
  int availableUnits;
  int discount;
  VoidCallback onTap;
  ProductCard({Key key, this.shadowColor, this.title, this.onTap, this.image, this.price, this.category, this.availableUnits, this.discount});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool likeButton;
  @override
  void initState() {
    super.initState();
    likeButton=false;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(

          child: Stack(
            children: [
              InkWell(
                onTap: widget.onTap,
                child: Column(
                  children: [
                    Expanded(
                        flex: 7,
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 10,
                                left: 12,
                                right: 12,
                              ),
                              decoration: BoxDecoration(
                                //color: Colors.yellow,
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: CachedNetworkImageProvider(widget.image),
                                  )
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  right: 100
                              ),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF57D970),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(10)
                                        ),
                                      ),
                                      height: 40,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${widget.discount}%",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      )
                                  )
                              ),
                            )
                          ],
                        )
                    ),

                    Expanded(
                        flex: 2,
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 5,
                                right: 15
                            ),
                            width: 200,
                            //color: Colors.greenAccent,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: OwnColors.mainBlue,
                                  //fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.start,
                              ),
                            )
                        )
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 5,
                                right: 5
                            ),
                            width: 200,
                            //height: 100,
                            //color: Colors.blueGrey,
                            child:Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    //color: Colors.yellow,
                                      child: widget.discount==0?
                                      Text(
                                        "\$${widget.price.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},')}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            color: OwnColors.mainBlue,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                          :
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Container(
                                                  //color: Colors.green,
                                                  child: Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      "\$${widget.price.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},')}",
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 10,
                                                          color: Colors.redAccent.withOpacity(0.8),
                                                          fontWeight: FontWeight.bold,
                                                          decoration: TextDecoration.lineThrough
                                                      ),
                                                    ),
                                                  ),
                                                )
                                            ),

                                            Expanded(
                                                flex: 2,
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "\$${this.calcularDescuento(widget.price, widget.discount).toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},')} COP",
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 16,
                                                        color: OwnColors.mainBlue,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                )
                                            )
                                          ],
                                        ),
                                      )
                                  ),
                                ),
                              ],
                            )
                        )
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          //color: Colors.red,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: InkWell(
                                      child: Icon(
                                        likeButton?OwnIcons.heart:OwnIcons.heart_outline,
                                        color: likeButton?Colors.red:Colors.blueGrey,
                                        size: 25,
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
                              Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: InkWell(
                                      child: Icon(
                                        OwnIcons.shopping_basket,
                                        color: Colors.blueGrey,
                                        size: 25,
                                      ),
                                      onTap: (){
                                        ControllerToastMessages.confirmAddToKart();
                                      },
                                    ),
                                  )
                              ),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
              Container(
                  child: widget.availableUnits==0?
                  Container(
                      color: Colors.white.withOpacity(0.8),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Agotado",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                  )
                      :
                  Container()
              )
            ],
          )
      ),
    );
  }
  int calcularDescuento(int precio, int descuento){
    int precioConDescuento=(precio*(1-(descuento/100))).toInt();
    return precioConDescuento;
  }
}
