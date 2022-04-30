
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practice/models/User1.dart';
import 'package:practice/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User1? _userfromFirebaseUser(User? user){
    return user != null ? User1(uid:user.uid):null;
  }
  //auth change user stream
  Stream<User1?> get user{
    return _auth.authStateChanges().map((User? user)=>_userfromFirebaseUser(user!));
  }




  //sign in anon
  Future signin() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user1 = result.user;
      return user1;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign in with email and password
  Future signEmail(String email,String password) async{
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user1 = result.user;
      return _userfromFirebaseUser(user1);
      return user1;
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }
  //register with email and password
  Future registerEmail(String name,String email,String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user1 = result.user;
      await DatabaseService(uid:user1!.uid).updateUserData(name, 0, 0,0,'','','','','');
      await DatabaseService(uid: user1!.uid).addCollection(user1!.uid);
      return _userfromFirebaseUser(user1);
      return user1;
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign out
  Future signout() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}