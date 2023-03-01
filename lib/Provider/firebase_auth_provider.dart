import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthProvider extends ChangeNotifier {
  final gooleSignin = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await gooleSignin.signIn();
      if (googleUser != null) {
        _user = googleUser;
      } else {
        return;
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);

      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future logOut() async {
    try {
      await gooleSignin.disconnect();
      FirebaseAuth.instance.signOut();
      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
