import 'package:flutter/material.dart';

class Product{
  String _name;
  String _productId;
  int _price;
  int _unitsSelected;
  int _limitUnits;
  String _image;
  String _description;
  String _category;
  int _discount;

  Product.primary();
  Product(this._productId,this._name,this._price,this._unitsSelected,this._limitUnits,this._image,this._description,this._category,this._discount);


  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get productId => _productId;

  set productId(String value) {
    _productId = value;
  }

  int get price => _price;

  set price(int value) {
    _price = value;
  }

  int get unitsSelected => _unitsSelected;

  set unitsSelected(int value) {
    _unitsSelected = value;
  }

  int get limitUnits => _limitUnits;

  set limitUnits(int value) {
    _limitUnits = value;
  }


  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }


  String get category => _category;

  set category(String value) {
    _category = value;
  }

  int get discount => _discount;

  set discount(int value) {
    _discount = value;
  }


  int getPriceWithDiscount(){
    int precioConDescuento=(this._price*(1-(this._discount/100))).toInt();
    return precioConDescuento;
  }

  String getPriceWithDiscountWithComa(){
    return this.getPriceWithDiscount().toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},');
  }

}