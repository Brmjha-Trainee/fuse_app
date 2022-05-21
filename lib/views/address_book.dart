import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';

class AddressBook extends StatefulWidget {
  @override
  _AddressBookState createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //done-RAWABI Use the appbar in theme_constant.dart
         appBar: myAppBar(context, title: 'Shipping Address'),
        SizedBox(
                  height: 90,
                width:400,
              child :Card(
                semanticContainer: true,
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: ListTile(
                    title: Text('Daamm'),
                    leading: Icon(
                      Icons.location_pin,
                      color: COLOR_PRIMARY,
                    ),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: COLOR_PRIMARY,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: COLOR_PRIMARY,
                            ))
                      ],
                    ),
                  )),),
                  SizedBox(
                    height: 90,
                width:400,
                    child: 
              Card(
                
                //semanticContainer: true,
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: ListTile(
                    title: Text('Daamm'),
                    leading: Icon(
                      Icons.location_pin ,
                      color: COLOR_PRIMARY,
                    ),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: COLOR_PRIMARY,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: COLOR_PRIMARY,
                            ))
                      ],
                    ),
                  )),),
              SizedBox(height: 30),
              darkBtn(label: ' Add Adress', onPressed: () {})
            ])));
  }
}
