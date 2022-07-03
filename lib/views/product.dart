import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/providers/home_provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Product {
  final String? title;
  final String? image;
  final String? price;
  final String? category;
  // final String? uid;
  int favorite;

  // List<String> favorite;

  Product({
    required this.title,
    required this.image,
    required this.price,
    required this.favorite,
    required this.category,
    // required this.uid,
  });

  factory Product.fromJson(DocumentSnapshot<Map<String, dynamic>> item) =>
      Product(
        title: item["title"],
        image: item["image"],
        price: item["price"],
        //  uid: item["uid"],
        category: item["category"],
        favorite: item["favorite"],
        /*  favorite: item["favories"] == null
            ? []
            : item["favorite"].map<String>((i) => i as String).toList(), */
      );
}
