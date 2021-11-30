import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:la_plaza_app/models/client.dart';




class CloudFireStoreAPI {

  final String USERS_COLLECTION= "users";
  final FirebaseFirestore dataBase= FirebaseFirestore.instance;


  Future<void> registerUserInDB(Client user) async{
    DocumentReference reference= dataBase.collection(this.USERS_COLLECTION).doc(user.id);
    return await reference.set({
      "id": user.id,
      "email": user.email,
    });
  }


  Future<bool> checkIfUserExistsInDB(String email,String userId)async{
    bool exists=false;
    QuerySnapshot snapshot= await dataBase.collection(this.USERS_COLLECTION).get();
    snapshot.docs.forEach((documento){
      if(documento["email"]==email || documento["id"]==userId){
        exists=true;
      }
    });
    return exists;
  }




}



