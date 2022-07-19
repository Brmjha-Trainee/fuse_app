import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/views/product.dart';
import 'package:fuseapp/views/home.dart';

class HomeProvider with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Product> products = [];
  List<Product> favorite = [];
  String text = "";

  final List<Map> classification = <Map>[
    {"title": "Microcontroller", "is pressed": false},
    {"title": "Motors", "is pressed": false},
    {"title": "Kit", "is pressed": false},
    {"title": "Transistor", "is pressed": false},
    {"title": "Display", "is pressed": false},
    {"title": "Robots", "is pressed": false},
    {"title": "Tools", "is pressed": false},
    {"title": "Others", "is pressed": false},
  ];
  int selectedcalss = 0;
  String searchCtegory = "";
  currentUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  // get product data from firestore

  fetchProducts() async {
    var qn = await _firestore.collection("Item").get();
    List<Product> productList = [];

    for (var i in qn.docs) {
      productList.add(Product.fromJson(i));
    }

    print("results of favorite${productList[0].title} ");
    products = productList;
    notifyListeners();
  }

  searchText(String covariant) {
    text = covariant;
    print("from provider");
    print("text from pro $text");
    notifyListeners();
  }

// for filter featsure
  CategoryP(index) {
    selectedcalss = index;
    classification[index]["is pressed"] = !classification[index]["is pressed"];
    if (classification[index]["is pressed"]) {
      searchCtegory = classification[index]["title"];
      print("i am in cstegory provider");
    } else {
      searchCtegory = "";
      print("i am in cstegory provider else");
    }
    notifyListeners();
  }

// get favorite data from firestore
  fetchfavorite() async {
    String? uid = currentUserId();

    var qn = await _firestore
        .collection('Favourite')
        .doc(uid)
        .collection('user_orders')
        .get();
    List<Product> productList = [];

    for (var i in qn.docs) {
      productList.add(Product.fromJson(i));
    }

    print("results of favorite${productList[0].title} ");
    products = productList;
    print(products[0].title);
    notifyListeners();
  }

// function to add product to the favorite list
  Future addPro(Product Prod) async {
    String? uid = currentUserId();

    var favoraite = await FirebaseFirestore.instance
        .collection('Favourite')
        .doc(uid)
        .collection("favorite");

    favoraite
        .add({
          'title': Prod.title,
          'image': Prod.image,
          'price': Prod.price,
          'favorite': Prod.favorite,
          'category': Prod.category,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
