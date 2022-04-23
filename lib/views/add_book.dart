import 'package:flutter/material.dart';

import '../theme/theme_constants.dart';
import '../utils/forms_validations.dart';

class AddAdressBook extends StatefulWidget {
  @override
  _AddAdressBookState createState() => _AddAdressBookState();
}

class _AddAdressBookState extends State<AddAdressBook> {
   TextEditingController _dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   void initState() {
    _dateController.text = ""; //set the initial value of text field
    super.initState();
  }
 // FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: 'Shipping Address'),
      body: Container(
        padding: const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
             Form(
              key: _formKey,
              child: Column(
                  children: <Widget>[
                    inputText(
                label: 'City',
                controller: _dateController,
        validation: (val) {
          return validateRequiredField(_dateController.text);}
              ),
            
           inputText(
                label: 'District',
               controller: _dateController,
        validation: (val) {
          return validateRequiredField(_dateController.text);}
              ),
            inputText(
                label: 'Street',
            controller: _dateController,
        validation: (val) {
          return validateRequiredField(_dateController.text);}
              ),
             inputText(
                label: 'Zip Code',
              ),
            
            inputText(
                label: 'Link',
             controller: _dateController,
        validation: (val) {
          return validateRequiredField(_dateController.text);}
              ),
                  ])),
                   Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Add')),
                OutlinedButton(onPressed: () {}, child: Text('Cancel')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
