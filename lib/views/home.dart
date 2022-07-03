import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/providers/home_provider.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/view_model/auth_services.dart';
import 'package:fuseapp/views/favoriate.dart';
import 'package:fuseapp/views/item.dart';
import 'package:provider/provider.dart';
import '../views/product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

late Product productData;

class _HomePageState extends State<HomePage> {
  int selectedcalss = 0;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference favoraite =
      FirebaseFirestore.instance.collection('Favourite');
  Color _iconColor = Colors.grey;
  List _products = [];
  final TextEditingController searchTextController = TextEditingController();
  List<Product> _searchList = [];
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

  String text = ""; // intial the text in the search bar
  String searchCtegory = "";

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context, listen: false).fetchProducts();
    final searchProvider = Provider.of<HomeProvider>(context, listen: false);

    return Container(
      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Scaffold(
          body: Column(
        children: [
          Text(
            "Home",
            style: h1,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2, //spread radius
                    blurRadius: 6, // blur radius
                    offset: Offset(0, 4),
                  ),
                ]),
            child: Consumer<HomeProvider>(builder: (_, data, __) {
              return TextFormField(
                controller: searchTextController,
                onChanged: (covariant) {
                  data.searchText(covariant);
                  print(covariant);
                },
                decoration: InputDecoration(
                  hintText: ("Search what you are looking for"),
                  border: InputBorder.none,
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    color: COLOR_PRIMARY,
                    onPressed: () {},
                  ),
                ),
              );
            }),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "What are you planning to build?",
            style: h2,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 35,
            margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: ListView.builder(
              padding: EdgeInsets.only(
                right: 10,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(
                  right: 5,
                ),
                child: Consumer<HomeProvider>(builder: (_, data, ___) {
                  return ElevatedButton(
                      onPressed: () {
                        data.CategoryP(index);
                        print(index);
                      },
                      child: Text(
                        data.classification[index]["title"],
                        style: TextStyle(
                            color: data.classification[index]["is pressed"]
                                ? COLOR_PRIMARY
                                : DARKER_GREY,
                            fontSize: 10),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 1, color: Colors.grey),
                        shadowColor: Colors.grey.withOpacity(0.5),
                        primary: Colors.white,
                        onPrimary: GREY,
                        elevation: 15,
                      ));
                }),
              ),
            ),
          ),
          SizedBox(
            height: 28,
          ),

          // the main part of the pdocut container
          Consumer<HomeProvider>(builder: (_, data, __) {
            // start search in the search list by title
            List<Product> searchList = data.products
                .where((element) => element.title!
                    .toLowerCase()
                    .contains(data.text.toLowerCase()))
                .toList();
            print(text);

            // search on the search list by category for filter featsure
            List<Product> searchCtegoryList = searchList
                .where((element) => element.category!
                    .toLowerCase()
                    .contains(data.searchCtegory.toLowerCase()))
                .toList();
            return Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  itemCount: searchCtegoryList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 13,
                      mainAxisSpacing: 13,
                      crossAxisCount: 2,
                      childAspectRatio: 0.79),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    ProductDetails(searchCtegoryList[index]))),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 17, right: 10, left: 7, bottom: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2, //spread radius
                                  blurRadius: 6, // blur radius
                                  offset: Offset(0, 4),
                                ),
                              ]),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                searchCtegoryList[index].favorite == 0
                                    ? Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: IconButton(
                                            // add product in the favorite
                                            onPressed: () {
                                              data.addPro(
                                                Product(
                                                    title:
                                                        searchCtegoryList[index]
                                                            .title,
                                                    image:
                                                        searchCtegoryList[index]
                                                            .image,
                                                    price:
                                                        searchCtegoryList[index]
                                                            .price,
                                                    favorite:
                                                        searchCtegoryList[index]
                                                            .favorite,
                                                    category:
                                                        searchCtegoryList[index]
                                                            .category),
                                              );
                                            },
                                            icon: Icon(
                                              Icons.favorite_border,
                                              size: 17.5,
                                              color: COLOR_PRIMARY,
                                            )),
                                      )
                                    : Row(
                                        children: <Widget>[
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  searchCtegoryList[index]
                                                      .favorite--;
                                                });
                                              },
                                              icon: Icon(
                                                Icons.favorite,
                                                size: 17.5,
                                                color: COLOR_PRIMARY,
                                              )),
                                        ],
                                      ),
                                SizedBox(
                                  height: 6.63,
                                ),
                                Center(
                                  child: Container(
                                    height: 116,
                                    width: 151,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: NetworkImage(
                                            searchCtegoryList[index].image!),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RatingBar.builder(
                                        itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                        itemSize: 15,
                                        onRatingUpdate: (rating) {}),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(searchCtegoryList[index].title ??
                                            ""),
                                        Icon(
                                          Icons.add_shopping_cart_sharp,
                                          size: 20,
                                          color: GREY,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${searchCtegoryList[index].price!} SR",
                                      style:
                                          TextStyle(color: GREEN, fontSize: 10),
                                    )
                                  ],
                                ),
                              ]),
                        ));
                  }),
            );
          }),
        ],
      )),
    );
  }
}
