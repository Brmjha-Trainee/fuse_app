import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fuseapp/providers/home_provider.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/views/item.dart';
import 'package:provider/provider.dart';

import '../services//auth_services.dart';

class Favoriate extends StatefulWidget {
  const Favoriate({Key? key}) : super(key: key);

  @override
  State<Favoriate> createState() => _FavoriateState();
}

class _FavoriateState extends State<Favoriate> {
  int selectedcalss = 0;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference favoraite =
      FirebaseFirestore.instance.collection('Favourite');
/*   final favoriateChangeNotifierProvider =
      ChangeNotifierProvider<FavoriteNotifier>((ref) => FavoriteNotifier());
 */

  @override
  Widget build(BuildContext context) {

    Provider.of<HomeProvider>(context).fetchfavorite();
    final productData = Provider.of<HomeProvider>(context);
    final productList = productData.favorite;
    return Container(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Scaffold(
        body: Column(
          children: [
            Text(
              "Favorites",
              style: h1,
            ),
            SizedBox(
              height: 18,
            ),
            Consumer<HomeProvider>(builder: (_, data, __) {
              return Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.vertical,
                    itemCount: data.favorite.length,
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
                                      ProductDetails(data.favorite[index]))),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  IconButton(
                                      onPressed: () {
                                        //   addPro();
                                      },
                                      icon: Icon(
                                        Icons.favorite_border_outlined,
                                        size: 17.5,
                                        color: GREY,
                                      )),
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
                                              data.favorite[index].image!),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          Text(
                                              data.favorite[index].title ?? ""),
                                          Icon(
                                            Icons.add_shopping_cart_sharp,
                                            size: 20,
                                            color: GREY,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${data.favorite[index].price!} SR",
                                        style: TextStyle(
                                            color: GREEN, fontSize: 10),
                                      )
                                    ],
                                  ),
                                ]

                                /* Card(
                          elevation: 3,
                          child: Column(
                            children: [
                              AspectRatio(
                                  aspectRatio: 2,
                                  child: Container(
                                      color: Colors.yellow,
                                      child: Image.network(
                                        _products[index]["image"][0],
                                      ))),
                              Text("${_products[index]["title"]}"),
                              Text("${_products[index]["price"].toString()}"),
                            ],
                          ),
                        ), */
                                ),
                          ));
                    }),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class FavoriteNotifier {}
