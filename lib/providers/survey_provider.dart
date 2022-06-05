import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/view_model/survey_popup_vm.dart';

class SurveyInfo with ChangeNotifier {
  currentUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  Survey userSurvey = Survey();
  //Update user profile in DB
  Future<void> fetchPersonalInfo(BuildContext context) async {
    String? uid = currentUserId();
    try {
      var doc =
          await FirebaseFirestore.instance.collection('survey').doc(uid).get();
      userSurvey = Survey(
        rating: doc['rating'],
       // phoneNum: doc['phone_number'],
      );

      notifyListeners();
    } catch (e) {
      SnackBar snackBar = const SnackBar(
          content: Text('Updating your survey Failed!'),
          backgroundColor: Colors.red);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
