import 'package:cloud_firestore/cloud_firestore.dart';

class orders1 {
  String ? uid ;
  String? orderno;
  String? date;
  String? amount;
  String? status;
  


  orders1({
    this.uid,
    this.orderno,
        this.date,
        this.amount,
        this.status,
        
        
  });
  factory orders1.fromJson(DocumentSnapshot<Map<String, dynamic>> order)=> orders1(orderno:order['OrderNo.'] as String,date:order['Date'] as String,amount:order['TotalAmount'] as String ,status:order['Status'] );
 


  
 }
