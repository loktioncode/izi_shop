import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:izi_shop/model/user.dart';

class AuthService {
  // create user object based on FirebaseUser
  // User _userFromFirebaseUser(Firebase user){
  //   return user != null ? Cuser(uid:user.uid );
  // }

  //creating firebase instance
  FirebaseAuth auth = FirebaseAuth.instance;
  // FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
  // FirebaseAuth auth = FirebaseAuth.instanceFor(app: secondaryApp);
//  sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await FirebaseAuth.instance.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future createUser(String email, String pass) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future loginUser(String email, String pass) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

//sign in with email and password

//register with email and password

//get out

}
