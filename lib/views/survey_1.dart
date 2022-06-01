import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/routers/routing_constants.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/utils/forms_validations.dart';
import 'package:provider/provider.dart';

import '../providers/personal_info.dart';

class Survey1 extends StatefulWidget {
  const Survey1({Key? key}) : super(key: key);

  @override
  State<Survey1> createState() => _Survey1State();
}

class _Survey1State extends State<Survey1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _messageController = TextEditingController();
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference survey = FirebaseFirestore.instance.collection('survey');
  Future<void> addReview() {
    var uid = Provider.of<PersonalInfo>(context, listen: false);
    // Call the survey's CollectionReference to add a new review
    return survey
        .doc(uid.currentUserId())
        .update({
          'review': _messageController.text,
        })
        .then((value) => print("review Added"))
        .catchError((error) => print("Failed to add review: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar3(context),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Tell us a bit more about why you chose ',
                style: subtitle2,
                textAlign: TextAlign.center,
              ),
              textAreaInput(
                label: '',
                hintText: 'write your opinion here',
                validation: (val) {
                  validateTextArea(_messageController.text.trim());
                  return null;
                },
                controller: _messageController,
              ),
              SizedBox(
                height: 10,
              ),
              darkBtn(
                label: 'Submit',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    addReview();
                    Navigator.pushNamed(context, Survey2ViewRoute);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
