import 'package:flutter/material.dart';

import '../theme/theme_constants.dart';
class Add_adressBook extends StatefulWidget {
  @override
 _Add_adressBookState createState() => _Add_adressBookState();
}
class _Add_adressBookState extends State<Add_adressBook> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(title: Text('Shipping Adress'),),
      body: Container(
        padding: const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
               alignment: Alignment.centerLeft,
               child: inputText( label: 'City' ,
                ),
              
            ),
            SizedBox(
              height: 10,
            ),
            Align(
               alignment: Alignment.centerLeft,
               child: inputText( label: 'District' ,
                ),
              
            ),
            SizedBox(
              height: 10,
            ),
              Align(
               alignment: Alignment.centerLeft,
               child: inputText( label: 'Street' ,
                ),
              
            ),
            SizedBox(
              height: 10,
            ),
              Align(
               alignment: Alignment.centerLeft,
               child: inputText( label: 'Zip Code' ,
                ),
              
            ),
            SizedBox(
              height: 10,
            ),
              Align(
               alignment: Alignment.centerLeft,
               child: inputText( label: 'Link' ,
                ),
              
            ),
            SizedBox(
              height: 10,
            ), 
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Add')),
              OutlinedButton(
                  onPressed: ()  {
                  
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
