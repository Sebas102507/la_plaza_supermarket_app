import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth= FirebaseAuth.instance;// me trae tod lo que existe en la consolo de firebase, toda la composicion, lo que deje definido


  Future<String> authUser(String email, String password) async{
  User user= (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)).user;
  return user?.uid;
}

  Future<String> authEntry(String email, String password) async{
    try{
      User user= (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
      return user?.uid;
    }catch(e){
      return null;
    }
  }

signOut() async{
  await _auth.signOut();
  print("Cerrado");
}

}