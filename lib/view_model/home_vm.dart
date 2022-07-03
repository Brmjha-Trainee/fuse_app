import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../theme/theme_constants.dart';

class Feeds extends StatelessWidget {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Item").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            print('results ${snapshot.data}');

            if (!snapshot.hasData) return Text("loading");
            //    List<Product> products = [];

            return new GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(10),
                crossAxisSpacing: 13,
                mainAxisSpacing: 13,
                childAspectRatio: 0.79,
                children: snapshot.data!.docs.map((e) {
                  print('results ${e["title"]}');
                  return Container(
                    padding: EdgeInsets.only(top: 17, right: 5, left: 7),
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
                          Icon(
                            Icons.favorite_border_outlined,
                            size: 17.5,
                            color: GREY,
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
                                  image: NetworkImage(e['image']),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 9.47,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 9.47,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 9.47,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 9.47,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 9.47,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(e["title"]),
                                  Icon(
                                    Icons.add_shopping_cart_sharp,
                                    size: 20,
                                    color: GREY,
                                  ),
                                ],
                              ),
                              /*  Text(
                                          e["price".toString()],
                                          style: TextStyle(fontSize: 10, color: GREEN),
                                        ), */
                            ],
                          ),
                        ]),
                  );
                }).toList());
          }
          //   final data = snapshot.requireData;

          ),
    );
  }
}
