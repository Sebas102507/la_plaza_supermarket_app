import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_plaza_app/controllers/ClientController.dart';
import 'package:la_plaza_app/controllers/Product_controller.dart';
import 'package:la_plaza_app/models/product.dart';
import 'package:la_plaza_app/properties/own_colors.dart';
import 'package:la_plaza_app/ui/animations/scale_route.dart';
import 'package:la_plaza_app/ui/pages/product_info_page.dart';
import 'package:la_plaza_app/ui/widgets/history_bar.dart';
import 'package:la_plaza_app/ui/widgets/loading_widget_without_opacity.dart';
import 'package:la_plaza_app/ui/widgets/product_card.dart';
import 'package:la_plaza_app/ui/widgets/search_input.dart';



class Home extends StatefulWidget {
  ClientController clientController;
  Home({Key key, this.clientController});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchBarcontroller = TextEditingController();
  String productName;
  List<dynamic> products;
  List<dynamic> temporalProductsSearch;
  Set<String> history;
  bool displayHistory;
  getProducts() async {
    final response = await http.get(Uri.parse('https://api.bazzaio.com/v5/listados/listar_productos_tienda/590/0/'));
    if (response.statusCode == 200) {
      print("THE DATA WAS LOADED");
      setState(() {
        products=jsonDecode(response.body)["data"];
      });
    } else {
      throw Exception('FAILED TO LOAD THE DATA');
    }
  }


  @override
  void initState() {
    super.initState();
    this.history= new HashSet();
    this.displayHistory=false;
    getProducts();
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
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: OwnColors.greyBackground,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    //color: Colors.red,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              image: DecorationImage(
                                image: AssetImage("assets/LaPlazaLogo.png")
                              )
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    //color: Colors.blueGrey,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 15,
                          top: 15
                        ),
                        //color: Colors.brown,
                        child: SearchInput(controller: this.searchBarcontroller,backgroundColor: Colors.white,shadowColor: Colors.grey,title: "Buscar",
                            onChanged: (productName){
                              if(productName.length==0){
                                setState(() {
                                  this.temporalProductsSearch=null;
                                  this.displayHistory=false;
                                });
                              }else{
                                if(this.history!=null && this.history.length>0){
                                  setState(() {
                                    this.displayHistory=true;
                                  });
                                }
                              }
                            },
                          onSummited: (productName){
                            setState(() {
                              this.temporalProductsSearch=this.products.where((product) => product["nombre"].contains(productName)).toList();
                              this.history.add(productName);
                              this.displayHistory=false;
                            });
                          },
                          onTap: (){
                          if(this.history!=null && this.history.length>0){
                            setState(() {
                              this.displayHistory=true;
                            });
                          }
                          },
                        ),
                      )
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    //color: Colors.orange,
                    padding: EdgeInsets.only(
                        left: 10
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        this.temporalProductsSearch==null?"Todos los productos":"Resultados de la búsqueda",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: OwnColors.mainBlue,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 12,
                  child: Container(
                    //color: Colors.black,
                    child: products==null?
                      LoadingWidgetWithoutOpacity()
                        :
                        this.temporalProductsSearch==null?
                        Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12.0,
                              mainAxisSpacing: 12.0,
                              childAspectRatio: 0.65,
                              children: List.generate(products.length, (index) {
                                return ProductCard(
                                  shadowColor: Colors.grey,
                                  title: products[index]["nombre"],
                                  price: int.parse(products[index]["precio"]),
                                  category: products[index]["categoria"],
                                  discount: int.parse(products[index]["valor_promo"]),
                                  image: products[index]["imagen"],
                                  availableUnits: int.parse(products[index]["disponible"]),
                                  onTap: (){
                                    ProductController productController= new ProductController(new Product.primary());
                                    productController.setAllData(
                                        products[index]["nombre"],int.parse(products[index]["precio"]),int.parse(products[index]["disponible"]),
                                        products[index]["imagen"],products[index]["descripcion"],products[index]["categoria"],
                                        int.parse(products[index]["valor_promo"])
                                    );
                                    Navigator.push(context, ScaleRoute(page:ProductInfoPage(productController: productController)));
                                  },
                                );
                              }
                              )
                          ),
                        )
                            :
                        this.temporalProductsSearch.length==0?
                            Container(
                              padding: EdgeInsets.only(
                                left: 40,
                                right: 40
                              ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Ups... No se encontró ningún resulta asociado a tu búsqueda.",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                            )
                            :
                        Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12.0,
                              mainAxisSpacing: 12.0,
                              childAspectRatio: 0.65,
                              children: List.generate(temporalProductsSearch.length, (index) {
                                return ProductCard(
                                  shadowColor: Colors.grey,
                                  title: temporalProductsSearch[index]["nombre"],
                                  price: int.parse(temporalProductsSearch[index]["precio"]),
                                  category: temporalProductsSearch[index]["categoria"],
                                  discount: int.parse(temporalProductsSearch[index]["valor_promo"]),
                                  image: temporalProductsSearch[index]["imagen"],
                                  availableUnits: int.parse(temporalProductsSearch[index]["disponible"]),
                                  onTap: (){
                                    ProductController productController= new ProductController(new Product.primary());
                                    productController.setAllData(
                                        temporalProductsSearch[index]["nombre"],int.parse(temporalProductsSearch[index]["precio"]),int.parse(temporalProductsSearch[index]["disponible"]),
                                        temporalProductsSearch[index]["imagen"],temporalProductsSearch[index]["descripcion"],temporalProductsSearch[index]["categoria"],
                                        int.parse(temporalProductsSearch[index]["valor_promo"])
                                    );
                                    Navigator.push(context, ScaleRoute(page:ProductInfoPage(productController: productController)));
                                  },
                                );
                              }
                              )
                          ),
                        )
                  ),
                )
              ],
            ),
          ),
          displayHistory ?
          HistoryBar(
              history: this.history,
            onTap: (historyOption){
                setState(() {
                  this.searchBarcontroller.text=historyOption;
                  this.temporalProductsSearch=this.products.where((product) => product["nombre"].contains(historyOption)).toList();
                  this.history.add(historyOption);
                  this.displayHistory=false;
                  FocusScope.of(context).unfocus();
                });
            },
          )
              :
          Container()
        ],
      )
    );
  }
}

