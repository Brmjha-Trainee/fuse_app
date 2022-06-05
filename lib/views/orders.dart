import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fuseapp/routers/routing_constants.dart';
import 'package:provider/provider.dart';
import '../providers/personal_info.dart';
import '../providers/toggle_text.dart';
import '../theme/theme_constants.dart';
import '../translations/locale_keys.g.dart';

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
      await showRating();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: LocaleKeys.orders.tr()),
      body: Center(
        child: Text('data'),
      ),
    );
  }

  Widget buildRating() => Consumer<ToggleText>(builder: (context, val, _) {
        return RatingBar.builder(
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
  Future showRating() {
    var obj = Provider.of<ToggleText>(context, listen: false);

    // Create a CollectionReference called users that references the firestore collection
    CollectionReference rate = FirebaseFirestore.instance.collection('survey');
    var uid = Provider.of<PersonalInfo>(context, listen: false);
    Future<void> addReview() {
      // Call the survey's CollectionReference to add a new review
      return rate
          .doc(uid.currentUserId())
          .update({
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
}
