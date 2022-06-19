import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../view_model/address_book_vm.dart';
class AddressProvider with ChangeNotifier {
  currentUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

Adress1 ? useraddress ;
  //Add a new user Address in DB
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
  
  //Display the user Address in DB
  Future<void> fetchAdress(BuildContext context) async {


    String? uid = currentUserId();
    try {
      DocumentSnapshot<Map<String, dynamic>> doc =
          await FirebaseFirestore.instance.collection('User_Address').doc(uid).get();
useraddress = Adress1.fromJson(doc);
      notifyListeners();
    } catch (e) {
      
   SnackBar snackBar = const SnackBar(
    content: Text('No address'),
   backgroundColor: Colors.red);
   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  //edit the user Address in DB
    Future<void> editAdress( {required BuildContext context,
      required String city,
      required String district,
      required String street,
      required String zipCode,
      required String link}) async {


    String? uid = currentUserId();
    try {
await FirebaseFirestore.instance.collection('User_Address').doc(uid).update({
        'City': city,
        'District': district,
        'Street': street,
        'Zip Code': zipCode,
        'Link': link
      });
      Navigator.of(context).pop();
    } catch (e) {
      
   SnackBar snackBar = const SnackBar(
    content: Text('No address'),
   backgroundColor: Colors.red);
   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  //delete the user Address in DB
  Future<void> deleteAddress(BuildContext context) async {
    String? uid = currentUserId();
 await FirebaseFirestore.instance.collection('User_Address').doc(uid).delete(); 
useraddress = null;
notifyListeners();
 Navigator.of(context).pop();

}
 
}

