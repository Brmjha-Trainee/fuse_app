import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';



class AdressBook extends StatefulWidget {
  @override
 _AdressBookState createState() => _AdressBookState();
}

class _AdressBookState extends State<AdressBook> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(title: Text('Shipping Adress'),),
      body : Container(
        padding: const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
        child: ListView(
        
          children: <Widget>[
            Card(  elevation: 10,
        shadowColor: Colors.black,
        
        child :ListTile( title:Text('Daamm'),
        leading: Icon(Icons.location_pin , color: COLOR_PRIMARY,) ,
           trailing:Column( mainAxisSize: MainAxisSize.max,
          children: [IconButton (onPressed :(){} ,icon :Icon(Icons.edit , color: COLOR_PRIMARY,)) ,
          IconButton (onPressed :(){} ,icon :Icon(Icons.delete , color: COLOR_PRIMARY,))],)   ,)
        
        ),
            Card(
               
              elevation: 10,
        shadowColor: Colors.black,
        
        child :ListTile( title:Text('Daamm'),
        leading: Icon(Icons.location_pin , color: COLOR_PRIMARY,) ,
        trailing:Column( mainAxisSize: MainAxisSize.max,
          children: [IconButton (onPressed :(){} ,icon :Icon(Icons.edit , color: COLOR_PRIMARY,)) ,
          IconButton (onPressed :(){} ,icon :Icon(Icons.delete , color: COLOR_PRIMARY,))],) ,
        
            )
    ) ,
    SizedBox( height :30) , 
   darkBtn(
                              label: 'Add Adress',
                              onPressed: () {})])));
          }
         }
