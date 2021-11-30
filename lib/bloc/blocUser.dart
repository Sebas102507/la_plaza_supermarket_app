import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:la_plaza_app/models/client.dart';
import 'package:la_plaza_app/repository/auth_repository.dart';
import 'package:la_plaza_app/repository/cloud_firestore_repository.dart';
class UserBloc implements Bloc{

  @override
  void dispose() {}

  /////////////////Autenticaciones, inicio sesión y cerrar sesión////////////////////////////////////////////////////
  final auth_repository= AuthRepository();
  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();// nos devuelve el stream que estamos esperando
  Stream<User> get authStatus{// devuleve el estado de la sesión
    return  streamFirebase;
  }

  Future<String> authUser(String email, String password){
    return auth_repository.authUser(email,password);
  }

  Future<String> authEntry(String email, String password){
    return auth_repository.authEntry(email,password);
  }

  Future<void> signOut(){
    return auth_repository.signOut();
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////Cloud Firestore, subir, eliminar, editar  info a la base de datos////////////////////////////////////////////////////

  final cloudFirestore_repository= CloudFirestoreRepository();

  Future<void>  registerUserInDB(Client user){
    return cloudFirestore_repository.registerUserInDB(user);
  }
  Future<bool> checkIfUserExistsInDB(String email,String userId){
    return cloudFirestore_repository.checkIfUserExistsInDB(email,userId);
  }

}