import 'package:cloud_firestore/cloud_firestore.dart';

class SearchController{


  List<dynamic> getAllProducts(){
    var query=[];
    FirebaseFirestore.instance.collection("products").get().then((QuerySnapshot snapshot){
      for(int i=0; i< snapshot.docs.length;i++){
        print("EL TAMAÑO DEL SNAPSHOT: ${snapshot.docs.length}");
        query.add(snapshot.docs[i].data());
      }
    });
    return query;
  }


  List<dynamic> getCategoryProducts(String categoria){
    var query=[];
    FirebaseFirestore.instance.collection("products").where("category",isEqualTo: categoria).get().then((QuerySnapshot snapshot){
      for(int i=0; i< snapshot.docs.length;i++){
        print("EL TAMAÑO DEL SNAPSHOT: ${snapshot.docs.length}");
        query.add(snapshot.docs[i].data());
      }
    });
    return query;
  }


  List<dynamic> searchGeneralProducts(String value,var query){
    var queryTemporal;
    print("EL VALUE ES: ${value}");
    print("CAPITALIZE: ${value.toUpperCase()}");
    queryTemporal= [];
    if(value.isEmpty){
      print("ESTA VACÍO");
      query=this.getAllProducts();
    }else{
      query.forEach((element) {
        print("EL TIPO DE ELEMENT ES: ${element.runtimeType}");
        print(" ELEMENT ES: ${element}");
        print("DATO BUSCADOR: ${value.toUpperCase()}");
        if ((element['nombre'].toUpperCase()).contains(value.toUpperCase())){
          queryTemporal.add(element);
        }
      });
    }
    return queryTemporal;
  }

  List<dynamic> searchCategoryProduct(String value,var query,String category){
    var queryTemporal;
    print("EL VALUE ES: ${value}");
    print("CAPITALIZE: ${value.toUpperCase()}");
    queryTemporal= [];
    if(value.isEmpty){
      print("ESTA VACÍO");
      query=this.getCategoryProducts(category);
    }else{
      query.forEach((element) {
        print("EL TIPO DE ELEMENT ES: ${element.runtimeType}");
        print(" ELEMENT ES: ${element}");
        print("DATO BUSCADOR: ${value.toUpperCase()}");
        if ((element['nombre'].toUpperCase()).contains(value.toUpperCase())){
          queryTemporal.add(element);
        }
      });
    }
    return queryTemporal;
  }



}