import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:kaivigan_2022/models/user_model.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Auth Change User Stream
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map((User? user) {
      return _userFromFirebaseUser(user);
    });
  }

  Future checkUid() async {
    final User user = _auth.currentUser!;
    final uid = user.uid;
    return uid;
  }

  Future getUserProvider() async {
    final List<UserInfo> provider = _auth.currentUser!.providerData;
    return provider;
  }

  // Get User Email
  Future<String?> getCurrentEmail() async {
    return _auth.currentUser!.email;
  }

  // Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register
  Future<bool> registerWithEmailAndPassword(
      String email,
      String password,
      ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Sign In
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithCustomToken(String token) async {
    try {
      UserCredential result = await _auth.signInWithCustomToken(token);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> signInWithFacebook() async {
    FacebookAuthProvider facebookProvider = FacebookAuthProvider();

    facebookProvider.addScope('email');
    facebookProvider.setCustomParameters({'display': 'popup'});

    var res = await _auth.signInWithPopup(facebookProvider);

    return res.user != null ? true : false;

    // bool validated = await this.emailVerification();

    // return validated;
  }

  Future<String> signIn(String email, String pass) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return await ('Success');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return ('Wrong password provided for that user.');
      } else {
        print(e.code.toString());
        return (e.code.toString());
      }
    }
  }
  // Create User Obj on FirebaseUser
  UserModel? _userFromFirebaseUser(User? user) {
    return user != null
        ? UserModel(
      uid: user.uid,
      email: user.email,
      providerId: user.providerData.first.providerId,
      providerEmail: user.providerData.first.email,
    )
        : null;
  }
}
