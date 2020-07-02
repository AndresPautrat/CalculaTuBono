import 'package:calcula_tu_bono/pages/data_bond.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:calcula_tu_bono/models/user.dart';
import 'package:calcula_tu_bono/service/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Future register(String email, String pass) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      FirebaseUser user = result.user;
      DataBond.user = result.user.uid;
      return null;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  Future login(String email, String pass) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      DataBond.user = _userFromFirebaseUser(user).uid;
      return null;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
