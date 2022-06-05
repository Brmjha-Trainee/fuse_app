import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fuseapp/providers/ordersprovider.dart';
import 'package:fuseapp/routers/router.dart';

import '../theme/theme_constants.dart';

class Order_Detatils extends StatefulWidget {
OrderProvider obj;
int  index;
  Order_Detatils(this.obj , this.index );


  @override
  State<Order_Detatils> createState() => _Order_DetatilsState();
}

class _Order_DetatilsState extends State<Order_Detatils> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: 'Order Detatils '),
      body : new Container(
         alignment: Alignment.center,
          child: Column(
            
            children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
         children : [discription("Order No.",widget.obj.orderno![index],h7,h7),]),
 Row(
   mainAxisAlignment: MainAxisAlignment.center,
   children: [
     discription("Date",widget.obj.date![index],h7,h7),
   ],
 ),

              Container(
                height: 420,
                   child: _orderslistView(widget.obj , index),
                  ),
                 
               Container( 
                 child: ordersTotal(widget.obj , index))
                ])))
    
    
  ;
  }
}
 Row discription(String label , String orderdet ,TextStyle y,TextStyle h) {
    return Row(
children :[
  Text(label, style:  y),
  SizedBox(width: 20),
  Text (
  orderdet, style:  h
  ),
]);

}

 Row discription2(String label , String orderdet ,TextStyle y,TextStyle h) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
children :[
  Text(label, style:  y),
  SizedBox(width: 10),
  Text (
  orderdet, style:  h
  ),
]);}
Widget _orderslistView(OrderProvider obj , int index){   return ListView.builder(
 
  scrollDirection: Axis.vertical,
     padding: new EdgeInsets.only(left: 0.0, bottom: 8.0, right: 16.0),
 itemCount:obj.item_name!.length,
  itemBuilder:(BuildContext context,int index){
  return Material
  (  color: Colors.transparent ,
           shape: RoundedRectangleBorder(
    side: BorderSide(color: Colors.transparent)),
       child: new Column(
              children: <Widget>[
           
                new Padding(
                    padding: new EdgeInsets.all(7.0),
                          child: discription("Item Name",obj.item_name![index],h5,h7),
                    ),
                    
                    new Padding(
                          padding: new EdgeInsets.all(7.0),
                          child: discription("Item No.",obj.item_no![index],h5,h7),
                        ),
               
                          new Padding(
                          padding: new EdgeInsets.all(7.0),
                child: discription("Quantity",obj.quantity![index],h5,h7)),
                new Padding(
                          padding: new EdgeInsets.all(7.0),
                child: discription("Price",obj.price![index],h5,h7)),
                      
                             Divider(
              color: GREY,
              height: 10.0,
              
            ),
                    
              ],
            ),
          );
}
,
  

      );}

 Material ordersTotal(OrderProvider obj , int index){
  return Material(
            color: Colors.transparent ,   
            child: new Column(
              children: <Widget>[
    
                new Padding(
                    padding: new EdgeInsets.all(7.0),
                          child: discription2("Total",(obj.amount![index]-(obj.shipping![index] + obj.tax![index])).toString(),h7,h7),
                    ),
                  
                    new Padding(
                          padding: new EdgeInsets.all(7.0),
                          child: discription2("Shipping",obj.shipping![index].toString(),h7,h7),
                        ),
                         new Padding(
                          padding: new EdgeInsets.all(7.0),
                          child: discription2("Tax",obj.tax![index].toString(),h7,h7),
                        ),  
                      
                           new Padding(
                          padding: new EdgeInsets.all(7.0),
                          child:discription2("Total Amount",obj.amount![index].toString(),h4,h4),
                        ), 

         ]

                    
              ,
            ),
          );
}

