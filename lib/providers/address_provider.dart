import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddressProvider with ChangeNotifier {
  currentUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  //Update user profile in DB
  Future<void> addAddress(
      {required BuildContext context,
      required String city,
      required String district,
      required String street,
      required String zipCode,
      required String link}) async {
    //  SharedPreferences pref = await SharedPreferences.getInstance();
    // String? uid = pref.getString('uid');

    String? uid = currentUserId();
    try {
      await FirebaseFirestore.instance.collection('User_Address').doc(uid).set({
        'City': city,
        'District': district,
        'Street': street,
        'Zip Code': zipCode,
        'Link': link
      });

      Navigator.of(context).pop();
    } catch (e) {
      SnackBar snackBar = const SnackBar(
          content: Text('Updating your Profile Failed!'),
          backgroundColor: Colors.red);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
