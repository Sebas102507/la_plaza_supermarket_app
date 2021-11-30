import 'package:la_plaza_app/models/client.dart';
import 'package:la_plaza_app/repository/cloud_firestoreAPI.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFireStoreAPI();

  Future<void>  registerUserInDB(Client user){
    return _cloudFirestoreAPI.registerUserInDB(user);
  }
  Future<bool> checkIfUserExistsInDB(String email,String userId){
    return _cloudFirestoreAPI.checkIfUserExistsInDB(email,userId);
  }

}