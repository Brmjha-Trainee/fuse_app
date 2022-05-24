//Haneen
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:fuseapp/routers/routing_constants.dart';
import 'package:fuseapp/view_model/user_vm.dart';
import 'package:fuseapp/components/snack_bar.dart';

//todo haneen token & refresh token is missing (Done)
class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  OurUser? _userfirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return OurUser();
  }

  Stream<OurUser?>? get user {
    return _firebaseAuth.authStateChanges().map(_userfirebase);
  }

  Future<OurUser?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
//todo haneen redirect to home page? (Done)
      Navigator.pushReplacementNamed(context, HomeViewRoute);

      return _userfirebase(credential.user);
    } on auth.FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
    return null;
  }

  Future<OurUser?> createUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      //_user.uid = credential.user!.uid;
      // _user.email = credential.user!.email;
      Navigator.pushReplacementNamed(context, LoginViewRoute);
//fixme haneen write the code to save to DB (Done)
      return _userfirebase(credential.user);
    } on auth.FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
      //todo haneen handel error (Done)
    }
    return null;
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
