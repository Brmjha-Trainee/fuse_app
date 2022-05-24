import 'package:cloud_firestore/cloud_firestore.dart';

import '../view_model/user_vm.dart';

class OurDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<OurUser> getuserInfo(String uid) async {
   OurUser retVal = OurUser();
    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection('Users').doc(uid).get();
     retVal.uid = uid;
      retVal.email = _docSnapshot.get('email');
    //  retVal.name = _docSnapshot.get('name');
      //retVal.phoneNum = _docSnapshot.get('date');
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
