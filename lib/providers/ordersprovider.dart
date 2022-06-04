import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/view_model/orders_vm.dart';
import '../view_model/address_book_vm.dart';
import 'package:fuseapp/views/address_book.dart';
class OrderProvider with ChangeNotifier {
  currentUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

List<orders1> ? userorders =[] ;
 List<String> ? date =[];
  List<int> ? amount =[];
  List<int> ? shipping =[];
  List<int> ? tax =[];
   List<String> ? status =[];
    List<String> ? orderno =[];
    List<String> ? item_no =[];
    List<String> ? item_name =[];
List<String> ? price =[];
List<String> ? quantity =[];
  //Display the user Address in DB
  Future<void> fetchOrders(BuildContext context) async{
    try{
      String? uid = currentUserId();
      var ordersOutput =
      await FirebaseFirestore.instance.collection('Orders').doc(uid).collection('user_orders').get();

      var ordersList = ordersOutput.docs;

      for(var order in ordersList ){
        amount!.add(order['amount']);
        date!.add(order['date']);
        status!.add(order['status']);
        orderno!.add(order['orderno']);
         tax!.add(order['Tax']);
        shipping!.add(order['Shipping']);
        //This is How To access general data for the order
       var itemsOutput= await FirebaseFirestore.instance.collection('Orders').doc(uid).collection('user_orders').doc(order.id).collection('items').get();
       var itemsList= itemsOutput.docs;
     
       for(var item in itemsList){
        item_no!.add(item['item_no']);
        item_name!.add(item['item_name']);
        price!.add(item['price']);
        quantity!.add(item['quantity']);

         //This is How To access each item data for one order order
       }
      }
notifyListeners();

    }catch(e){  SnackBar snackBar = const SnackBar(
        content: Text('Updating your Profile Failed!'),
        backgroundColor: Colors.red);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);}
}
}