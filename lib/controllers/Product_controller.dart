import 'package:la_plaza_app/models/product.dart';

class ProductController{
  Product _product;


  ProductController(this._product);

  Product get product => _product;

  set product(Product value) {
    _product = value;
  }

  getName(){
    return _product.name;
  }

   setName(String value) {
    _product.name = value;
  }

  getId(){
    return _product.productId;
  }

  setId(String value) {
    _product.productId = value;
  }

  getPrice(){
    return _product.price;
  }

  setPrice(int value) {
    _product.price = value;
  }

  getUnitsSelected(){
    return _product.unitsSelected;
  }

  setUnitsSelected(int value) {
    _product.unitsSelected = value;
  }

  getLimitUnits(){
    return _product.limitUnits;
  }

  setlimitUnits(int value) {
    _product.limitUnits = value;
  }


  getImage(){
    return _product.image;
  }

  setImage(String value) {
    _product.image = value;
  }


  getDescription(){
    return _product.description;
  }

  setDescription(String value) {
    _product.description = value;
  }

  getCategory(){
    return _product.category;
  }

  setCategory(String value) {
    _product.category = value;
  }

  getDiscount(){
    return _product.discount;
  }

  setDiscount(int value) {
    _product.discount = value;
  }

  setAllData(String name,int price, int limitUnits,String image,String description,String category,int discount){
    this.setName(name);
    this.setPrice(price);
    this.setCategory(category);
    this.setDiscount(discount);
    this.setImage(image);
    this.setlimitUnits(limitUnits);
    this.setUnitsSelected(0);
    this.setDescription(description);
  }

}