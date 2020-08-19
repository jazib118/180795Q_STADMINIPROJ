import 'package:crudtest/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

//create user object based on Firebase
User _userFromFirebaseuser(FirebaseUser user){
return user != null ? User(uid: user.uid) : null;
}

//auth change user stream
Stream<User> get user{
  return _auth.onAuthStateChanged
  
  .map(_userFromFirebaseuser);
}



final FirebaseAuth _auth = FirebaseAuth.instance;
//sign in anon
Future signInAnon() async{
  try{
   AuthResult result = await _auth.signInAnonymously();
   FirebaseUser user = result.user;
   return _userFromFirebaseuser(user);
  }catch(e){
     print(e.toString());
     return null;
  }


}

//sign in with email and password
Future signInwithEmailandPassword(String email,String password)async{
  try{
     AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
     FirebaseUser user = result.user;
     return _userFromFirebaseuser(user);
  }catch(e)
  {
      print(e.toString());
      return null;
  }
}


//register with email and password
Future registerwithEmailandPassword(String email,String password)async{
  try{
     AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
     FirebaseUser user = result.user;
     return _userFromFirebaseuser(user);
  }catch(e)
  {
      print(e.toString());
      return null;
  }
}

//sign out
 Future signOut() async {
   try{
       return await _auth.signOut();
   }
   catch(e){
      print(e.toString());
      return null;
   }
 }

}