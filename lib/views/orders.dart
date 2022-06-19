import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fuseapp/routers/routing_constants.dart';
import 'package:fuseapp/views/orders_details.dart';
import 'package:provider/provider.dart';
import '../providers/personal_info.dart';
import '../providers/toggle_text.dart';
import '../theme/theme_constants.dart';
import '../translations/locale_keys.g.dart';
import 'package:fuseapp/providers/ordersprovider.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showRating(context);
    });
  }

  Widget build(BuildContext context) {
    Provider.of<OrderProvider>(context, listen: false).fetchOrders(context);
    var obj = Provider.of<OrderProvider>(context, listen: true);
    return Scaffold(
      appBar: myAppBar(context, title: LocaleKeys.orders.tr()),
      body: ListView.builder(
          padding: new EdgeInsets.only(left: 0.0, bottom: 8.0, right: 16.0),
          itemCount: obj.amount!.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 10,
              shadowColor: Colors.black,
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child: discription("Order No.", obj.orderno![index], h7),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        discription("Date.", obj.date![index], h7),
                        IconButton(
                            onPressed: () {
                              // Navigator.pushReplacementNamed(context,OrderDetatilsViewRoute ,arguments:
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OrderDetatils(obj, index)));
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: GREY,
                            ))
                      ],
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child: discription(
                        "Total Amount.",
                        obj.amount![index].toString(),
                        (const TextStyle(
                          color: GREEN,
                          fontSize: 14,
                        ))),
                  ),
                  new Padding(
                      padding: new EdgeInsets.all(7.0),
                      child: obj.status![index] == "Delivered"
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  Text('Deliverd',
                                      style: TextStyle(
                                          color: GREEN, fontSize: 14)),
                                  ElevatedButton(
                                      onPressed: () {}, child: Text('Track')),
                                ])
                          : Row(children: [
                              Text(
                                'Canceled',
                                style: TextStyle(color: RED, fontSize: 14),
                              ),
                            ]))
                ],
              ),
            );
          }),
    );
  }
}

Row discription(String label, String orderdet, TextStyle h) {
  return Row(children: [
    Text(label, style: h5),
    SizedBox(width: 10),
    Text(orderdet, style: h),
  ]);
}

Widget buildRating() => Consumer<ToggleText>(builder: (context, val, _) {
      return RatingBar.builder(
        initialRating: 1,
        minRating: 1,
        unratedColor: BLUISH_GRERY,
        updateOnDrag: true,
        itemBuilder: (context, _) => Icon(
          Icons.star_rate_rounded,
          color: COLOR_PRIMARY,
        ),
        onRatingUpdate: (rate) => val.setRating(rate),
      );
    });
Future showRating(BuildContext context) {
  var obj = Provider.of<ToggleText>(context, listen: false);

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference rate = FirebaseFirestore.instance.collection('survey');
  var uid = Provider.of<PersonalInfo>(context, listen: false);
  Future<void> addReview() {
    // Call the survey's CollectionReference to add a new review
    return rate
        .doc(uid.currentUserId())
        .set({
          'rating': obj.rating,
        })
        .then((value) => print("rating Added"))
        .catchError((error) => print("Failed to add rating: $error"));
  }

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'How would you rate your experience with fuse',
            textAlign: TextAlign.center,
            style: h2,
          ),
          SizedBox(
            height: 20,
          ),
          buildRating(),
        ],
      ),
      actions: [
        TextButton(
          child: Text('Rate us'),
          onPressed: () {
            Navigator.pushReplacementNamed(context, Survey1ViewRoute,
                arguments: obj);
            addReview();
          },
        )
      ],
    ),
  );
}
