import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ControllerToastMessages{


  static emailAlreadyExists(){
    Fluttertoast.showToast(
        msg: "El correo ya está registrado",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.grey,
        timeInSecForIosWeb: 2);
  }

  static invalidPassword(){
    Fluttertoast.showToast(
        msg: "Contraseña incorrecta ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.grey,
        timeInSecForIosWeb: 2);
  }

  static invalidEmailorPassword(){
    Fluttertoast.showToast(
        msg: "Digita un correo o contraseña válido.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.grey,
        timeInSecForIosWeb: 2);
  }


  static validUpdateProfile(){
    Fluttertoast.showToast(
        msg: "Se actualizó el perfil.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.grey,
        timeInSecForIosWeb: 2);
  }


  static confirmAddToKart(){
    Fluttertoast.showToast(
        msg: "Se añadió al carrito.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.grey,
        timeInSecForIosWeb: 2);
  }






}