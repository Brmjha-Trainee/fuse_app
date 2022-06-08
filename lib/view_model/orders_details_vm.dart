import 'package:cloud_firestore/cloud_firestore.dart';

class OrderItems {
  String ? uid ;
  String? item_name;
  String? item_no;
  String? price;
  String? quantity;



  OrderItems ({
    this.uid,
    this.item_name,
    this.item_no,
    this.price,
    this.quantity,



  });
  factory OrderItems.fromJson(DocumentSnapshot<Map<String, dynamic>> order2)=> OrderItems(item_name:order2['item_name'],item_no:order2['item_no'],price:order2['price'],quantity:order2['quantity']);




}