import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/providers/personal_info.dart';
import 'package:fuseapp/view_model/survey_vm.dart';
import 'package:provider/provider.dart';

class FeedBackProvider with ChangeNotifier {
  sendSelectedChoicesToDB(
      BuildContext context, List<SurveyChoices> selectedItem) {
    // Create a CollectionReference called users that references the firestore collection
    var uid = Provider.of<PersonalInfo>(context, listen: false);

    CollectionReference survey =
        FirebaseFirestore.instance.collection('survey');
    var arr = [];
    if (selectedItem.isEmpty) {
    } else {
      for (int i = 0; i < selectedItem.length; i++) {
        arr.add(selectedItem[i].choiceText);
      }
      print(arr);
    }
    // Call the survey's CollectionReference to add a new review
    return survey
        .doc(uid.currentUserId())
        .update({
          'choices': arr,
        })
        .then((value) => print("choices Added"))
        .catchError((error) => print("Failed to add choices: $error"));
  }
}
