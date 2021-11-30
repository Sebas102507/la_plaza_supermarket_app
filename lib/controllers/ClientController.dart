import 'package:la_plaza_app/models/client.dart';

class ClientController{
  Client _user;


  String getEmail(){ return _user.email;}

  setEmail(String value) {
    _user.email = value;
  }

  String getPassword(){ return _user.password;}

  setPassword(String value) {
    _user.password = value;
  }

  String getId(){ return _user.id;}

  setId(String value) {
    _user.id = value;
  }


  Client get user => _user;

  setUser(Client us){
    this._user=us;
  }

  void createClientWithEmailAndPassword(String email, String password){
    if(email.length==0 || !email.contains("@") || !email.contains(".")){
      throw new Exception("Digita un correo válido");
    } else if(password.length<8){
      throw new Exception("Digita una contraseña válida Min: 8 caracteres.");
    }else{
      this._user= new Client(email, password);
    }
  }
}

