
import 'package:la_plaza_app/repository/Firebase_auth_api.dart';

class AuthRepository { // se usa para swichear la fuente de datos, gmail , facebook, etc

final _firebaseAuthAPI= FirebaseAuthAPI();


  Future<String> authUser(String email, String password){
  return _firebaseAuthAPI.authUser(email,password);
  }

Future<String> authEntry(String email, String password){
  return _firebaseAuthAPI.authEntry(email,password);
}

  signOut()=>_firebaseAuthAPI.signOut();


}