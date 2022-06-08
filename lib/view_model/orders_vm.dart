import 'package:cloud_firestore/cloud_firestore.dart';

import 'orders_details_vm.dart';

class OrdersInfo {
  String ? uid ;
  String? orderno;
  String? date;
  int? amount;
  String? status;
  int? shipping;
  int? tax;
List<OrderItems>? items;


  OrdersInfo({
    this.uid,
    this.orderno,
    this.date,
    this.amount,
    this.status,
    this.shipping,
    this.tax,
    this.items


  });
  factory OrdersInfo.fromJson(DocumentSnapshot<Map<String, dynamic>> order, List<OrderItems>? item)=> OrdersInfo(orderno:order['orderno'],date:order['date'],amount:order['amount'] as int,status:order['status'],shipping:order['Shipping'] as int ,tax:order['Tax']  as int, items: item);




}

