import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/view_model/user_vm.dart';

class PersonalInfo with ChangeNotifier {
  currentUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  OurUser userData = OurUser();
  //Update user profile in DB
  Future<void> fetchPersonalInfo(BuildContext context) async {
    String? uid = currentUserId();
    try {
      var doc =
          await FirebaseFirestore.instance.collection('Users').doc(uid).get();
      userData = OurUser(
        name: doc['name'],
        phoneNum: doc['phone_number'],
        avatarURL: doc['avatar'],
        email: doc['email'],
      );
      notifyListeners();
    } catch (e) {
      SnackBar snackBar = const SnackBar(
          content: Text('Updating your Profile Failed!'),
          backgroundColor: Colors.red);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
