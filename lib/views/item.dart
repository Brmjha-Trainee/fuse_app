import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fuseapp/views/product.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:fuseapp/theme/theme_constants.dart';

class ProductDetails extends StatefulWidget {
  Product product;
  ProductDetails(this.product);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int count = 1;
  final List<String> images = [
    "assets/img/Pic1.png",
    "assets/img/Pic2.png",
    "assets/img/Pic3.png",
  ];
  int activeindex = 0;
  final controller = CarouselController();
  List<Widget> generateImage() {
    return images
        .map((e) => ClipRRect(
              child: Image.asset(
                e,
                fit: BoxFit.cover,
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar(context, title: ''),
        body: Stack(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Positioned(
            child: Icon(
              Icons.favorite_border_outlined,
              size: 21.5,
              color: IN_BETWEEN_GREY,
            ),
            left: 430.17,
            top: 10,
          ),
          Positioned(
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 24.5,
              color: IN_BETWEEN_GREY,
            ),
            left: 430.17,
            top: 40,
          ),
          Positioned(
            child: Icon(
              Icons.share_outlined,
              size: 24.5,
              color: IN_BETWEEN_GREY,
            ),
            left: 430.17,
            top: 190,
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            //    foregroundDecoration: BoxDecoration(color: Colors.black12),
            height: 200,
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 300,
                  child: CarouselSlider(
                    items: generateImage(),
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) =>
                          setState((() => activeindex = index)),
                    ),
                    carouselController: controller,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                buildIndicator(),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(top: 260, left: 20),
                // foregroundDecoration: BoxDecoration(color: Colors.black12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.title ?? ""),
                    Text("SAR ${widget.product.price}"),
                    RatingBar.builder(
                        itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                        itemSize: 15,
                        onRatingUpdate: (rating) {}),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "DESCREPTION",
                      style: TextStyle(color: DARKER_GREY),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 2.5,
                      width: 45,
                      color: COLOR_PRIMARY,
                      margin: EdgeInsets.only(bottom: 25.0),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "DESCREPTION",
                      style: TextStyle(color: IN_BETWEEN_GREY),
                    ),
                    SizedBox(
                      height: 34,
                    ),
                    Text(
                      "You May also like",
                      style: TextStyle(color: DARKER_GREY),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 2.5,
                      width: 45,
                      color: COLOR_PRIMARY,
                      margin: EdgeInsets.only(bottom: 25.0),
                    ),
                    Container(
                      height: 170,
                      padding: EdgeInsets.only(
                          top: 0, left: 20, right: 20, bottom: 10),
                      child: Expanded(
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("Item")
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              print('results ${snapshot.data}');

                              if (!snapshot.hasData) return Text("loading");
                              //    List<Product> products = [];

                              return new ListView(
                                  scrollDirection: Axis.horizontal,
                                  //   padding: EdgeInsets.all(10),
                                  children: snapshot.data!.docs.map((e) {
                                    print('results ${e["title"]}');
                                    return Container(
                                      margin: EdgeInsets.only(
                                          top: 10, right: 5, left: 7),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2, //spread radius
                                              blurRadius: 6, // blur radius
                                              offset: Offset(0, 4),
                                            ),
                                          ]),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 3,
                                            ),
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
                                                height: 95,
                                                width: 112,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.fitWidth,
                                                    image: NetworkImage(
                                                        e['image']),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                RatingBar.builder(
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        ),
                                                    itemSize: 10,
                                                    onRatingUpdate:
                                                        (rating) {}),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(e["title"],
                                                        style: TextStyle(
                                                            fontSize: 10)),
                                                    Icon(
                                                      Icons
                                                          .add_shopping_cart_sharp,
                                                      size: 10,
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
                      ),
                    ),
                  ],
                )),
          ),
          Positioned(
            top: 260,
            left: 359,
            child: Container(
              height: 29,
              width: 73,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: IN_BETWEEN_GREY)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.remove,
                        size: 10,
                      ),
                      onTap: () {
                        setState(() {
                          if (count > 1) {
                            count--;
                          }
                        });
                      },
                    ),
                    Text(
                      count.toString(),
                      style: TextStyle(fontSize: 10),
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.add,
                        size: 10,
                      ),
                      onTap: () {
                        setState(() {
                          count++;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 69,
                width: double.infinity,
                child: RaisedButton(
                    color: COLOR_PRIMARY,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: Text(
                      "Add to cart ",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {})),
          )
        ]),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeindex,
        count: images.length,
        effect: ExpandingDotsEffect(
          dotHeight: 10,
          dotWidth: 10,
          activeDotColor: COLOR_PRIMARY,
          dotColor: IN_BETWEEN_GREY,
        ),
      );
}
