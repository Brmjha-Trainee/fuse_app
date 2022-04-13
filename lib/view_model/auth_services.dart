//Haneen
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:fuseapp/view_model/user_vm.dart';
import 'package:fuseapp/components/snack_bar.dart';
import '../views/login.dart';

//todo haneen token & refresh token is missing (Done)
class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userfirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userfirebase);
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
//todo haneen redirect to home page? (Done)
      return _userfirebase(credential.user);
    } on auth.FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
//fixme haneen write the code to save to DB (Done)
      return _userfirebase(credential.user);
    } on auth.FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
      //todo haneen handel error (Done)
    }
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
