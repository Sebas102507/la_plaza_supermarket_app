import 'package:la_plaza_app/models/user.dart';

class Client extends User{
  Client(String email,String password) : super(email,password);
  Client.ExistingUser(String correo,String id): super.usuarioExistente(correo,id);


}