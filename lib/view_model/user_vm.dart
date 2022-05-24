import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  String? uid;
  String? email;
  String? name;
  String? phoneNum;
  int? birth;

  OurUser({
    this.uid,
    this.email,
    this.name,
    this.birth,
    this.phoneNum,
  });
  // OurUser.fromDocumentSnapshot({DocumentSnapshot? doc}) {
  //   Map<String, dynamic>? json = doc!.data() as Map<String, dynamic>?;
  //   uid = doc.id;
  //   name = json!['name'];
  //   email = json['email'];
  //   phoneNum = json['phoneNum'];
  //   birth = json['date'];
  // }
}
