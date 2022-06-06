import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/view_model/survey_vm.dart';

class FeedBackProvider with ChangeNotifier {
  sendSelectedChoicesToDB(BuildContext context, SurveyChoices selectedchoice) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference survey =
        FirebaseFirestore.instance.collection('survey');
    // Call the survey's CollectionReference to add a new review
    return survey
        .add({
          'choices': selectedchoice.choiceText,
        })
        .then((value) => print("choices Added"))
        .catchError((error) => print("Failed to add choices: $error"));
  }
}
