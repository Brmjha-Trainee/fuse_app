import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/view_model/orders_vm.dart';
import '../view_model/address_book_vm.dart';
import 'package:fuseapp/views/address_book.dart';

import '../view_model/orders_details_vm.dart';
class OrderProvider with ChangeNotifier {
  currentUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }



 List<OrdersInfo>? ordersDate =[];

  //Display the user Address in DB
  Future<void> fetchOrders(BuildContext context) async{
    try{
      String? uid = currentUserId();
      var ordersOutput =
      await FirebaseFirestore.instance.collection('Orders').doc(uid).collection('user_orders').get();

      var ordersList = ordersOutput.docs;

      List<OrdersInfo>? subData=[];

      for(var order in ordersList ){

        //This is How To access general data for the order
       var itemsOutput= await FirebaseFirestore.instance.collection('Orders').doc(uid).collection('user_orders').doc(order.id).collection('items').get();
       var itemsList= itemsOutput.docs;
       List<OrderItems>? subItems=[];

       for(var item in itemsList){

        subItems.add(OrderItems.fromJson(item));

         //This is How To access each item data for one order order
       }
       subData.add(OrdersInfo.fromJson(order,subItems));
      }
      ordersDate=subData;

notifyListeners();

    }catch(e){  SnackBar snackBar =  SnackBar(
        content: Text('Updating your Profile Failed! $e'),
        backgroundColor: Colors.red);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);}
}
}