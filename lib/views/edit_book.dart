import 'package:flutter/material.dart';
import 'package:fuseapp/view_model/address_book_vm.dart';
import 'package:fuseapp/views/address_book.dart';
import 'package:provider/provider.dart';
import '../providers/address_provider.dart';
import '../theme/theme_constants.dart';
import '../utils/forms_validations.dart';

class EditAdressBook extends StatefulWidget {
  Adress1 A;
  EditAdressBook(this.A );
  @override
  _EditAdressBookState createState() => _EditAdressBookState();
}

class _EditAdressBookState extends State<EditAdressBook> {
  TextEditingController _dateController = TextEditingController();

  @override
  
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController linkController = TextEditingController();


  void initState() {
   cityController.text = widget.A.city.toString() ;
  districtController.text = widget.A.district.toString() ;
streetController.text =widget.A.street.toString() ;
  zipCodeController.text =widget.A.zipCode.toString() ;
 linkController.text = widget.A.link.toString() ; 
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
                     ),
                  inputText(
                      label: 'District',
                      controller: districtController,
                    ),
                  inputText(
                      label: 'Street',
                      controller: streetController,
                    ),
                  inputText(label: 'Zip Code', controller: zipCodeController),
                  inputText(
                      label: 'Link',
                      controller: linkController,
                      ),
                ])),
  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {
                 Provider.of<AddressProvider>(context, listen: false)
                          .editAdress(
                              context: context,
                              city: cityController.text,
                              street: streetController.text,
                              zipCode: zipCodeController.text,
                              link: linkController.text,
                              district: districtController.text);
              }, child: Text('Save')),
              OutlinedButton(
                  onPressed: ()  {
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
