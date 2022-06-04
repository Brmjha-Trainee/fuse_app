import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fuseapp/views/orders_details.dart';
import 'package:provider/provider.dart';

import '../providers/ordersprovider.dart';
import '../routers/routing_constants.dart';
import '../theme/theme_constants.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    Provider.of<OrderProvider>(context, listen: false).fetchOrders(context);
     var obj = Provider.of<OrderProvider>(context, listen: true);
   
     return Scaffold(
appBar: myAppBar(context, title: 'Orders'),
 body: ListView.builder(
     padding: new EdgeInsets.only(left: 0.0, bottom: 8.0, right: 16.0),
 itemCount:obj.amount!.length,
  itemBuilder:
  ( BuildContext   context , int index ){
  return Card(
           elevation: 10,
                    shadowColor: Colors.black,   
            child: new Column(
              children: <Widget>[
                new Padding(
                    padding: new EdgeInsets.all(7.0),
                          child: discription("Order No.",obj.orderno![index],h7),
                    ),
                    new Padding(
                          padding: new EdgeInsets.all(7.0),
                          child:
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [ 
                               discription("Date.",obj.date![index],h7),
                                IconButton(
                              onPressed: () {
                                // Navigator.pushReplacementNamed(context,OrderDetatilsViewRoute ,arguments: 
                                  Navigator.push( context,MaterialPageRoute(builder: (context) => Order_Detatils(obj , index)));
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: GREY,
                              ))
                             ],
                           ),
                        ),
                          new Padding(
                          padding: new EdgeInsets.all(7.0),
                        
                child: discription("Total Amount.",obj.amount![index].toString(),(const TextStyle(color: GREEN,fontSize: 14,))),
                        ),
                      
                        new Padding(   padding: new EdgeInsets.all(7.0),
                          child:  obj.status![index] == "Delivered" ? Row(
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
 children :[ 
    Text('Deliverd' , style: TextStyle(color:GREEN, fontSize: 14)) ,   ElevatedButton(
onPressed: () {

      },
         child: Text('Track')),

         ]
        ) :
        Row(
 children :[ 
    Text('Canceled' , style: TextStyle(color:RED, fontSize: 14),) ,
 ] 
    ))
                    
              ],
            ),
          );
}

      ),
    )
  ;
  }
}
 Row discription(String label , String orderdet ,TextStyle h) {
    return Row(
children :[
  Text(label, style:  h5),
  SizedBox(width: 10),
  Text (
  orderdet, style:  h
  ),
]);

}
