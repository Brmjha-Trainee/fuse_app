import 'package:flutter/material.dart';
import 'package:fuseapp/providers/address_provider.dart';
import 'package:provider/provider.dart';

import '../theme/theme_constants.dart';
import '../utils/forms_validations.dart';

class AddAdressBook extends StatefulWidget {
  @override
  _AddAdressBookState createState() => _AddAdressBookState();
}

class _AddAdressBookState extends State<AddAdressBook> {
  TextEditingController _dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController linkController = TextEditingController();

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
                child: Column(children: <Widget>[
                  inputText(
                      label: 'City',
                      controller: cityController,
                      validation: (val) {
                        return validateRequiredField(_dateController.text);
                      }),
                  inputText(
                      label: 'District',
                      controller: districtController,
                      validation: (val) {
                        return validateRequiredField(_dateController.text);
                      }),
                  inputText(
                      label: 'Street',
                      controller: streetController,
                      validation: (val) {
                        return validateRequiredField(_dateController.text);
                      }),
                  inputText(label: 'Zip Code', controller: zipCodeController),
                  inputText(
                      label: 'Link',
                      controller: linkController,
                      validation: (val) {
                        return validateRequiredField(_dateController.text);
                      }),
                ])),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Provider.of<AddressProvider>(context, listen: false)
                          .addAddress(
                              context: context,
                              city: cityController.text,
                              street: streetController.text,
                              zipCode: zipCodeController.text,
                              link: linkController.text,
                              district: districtController.text);
                      print(cityController.text);
                    },
                    child: Text('Add')),
                OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
