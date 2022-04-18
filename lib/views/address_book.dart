import 'package:flutter/material.dart';

import '../theme/theme_constants.dart';
class AddressBook extends StatefulWidget {
  const AddressBook({ Key? key }) : super(key: key);

  @override
  State<AddressBook> createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: myAppBar(context, title: 'Shipping Address'),
      body: Center(
        child: Text('tgbe'),
      ),
    );
  }
}