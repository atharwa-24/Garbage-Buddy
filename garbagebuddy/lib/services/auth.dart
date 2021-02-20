import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:garbagebuddy/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on User
  FireUser _userFromFirebaseUser(User user) {
    return user != null ? FireUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<FireUser> get user {
    return _auth.authStateChanges()
    //.map((User user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //sign-in email&pass
  Future signInEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign-out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }
}