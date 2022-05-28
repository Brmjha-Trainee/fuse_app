import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'dart:io';

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  currentUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  Future<void> uploadFile(
    String filePath,
    String fileName,
  ) async {
    File file = File(filePath);
    String? uid = currentUserId();
    try {
      await storage.ref('avatars/$fileName').putFile(file);
      String downloadURL =
          await storage.ref('avatars/$fileName').getDownloadURL();
      CollectionReference users =
          FirebaseFirestore.instance.collection('Users');
      return users
          .doc(uid)
          .update({
            'avatar': downloadURL,
          })
          .then((value) => print("avatar Updated"))
          .catchError((error) => print("Failed to update avatar: $error"));
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }
}
