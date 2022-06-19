import 'dart:html';
import 'package:fuseapp/views/draft.dart';

import '../theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

import '../services/local_notifications.dart';
class Notification1 extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification1> {
  @override
  String notificationMsg ="Waiting for notification";
  void initState() {
    super.initState();

    LocalNotificationService.initilize();

    // Terminated State
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (event != null) {
        setState(() {
          notificationMsg =
              "${event.notification!.title} ${event.notification!.body} ";
        });
      }
    });

    // Foregrand State
    FirebaseMessaging.onMessage.listen((event) {
      LocalNotificationService.showNotificationOnForeground(event);
      setState(() {
        notificationMsg =
            "${event.notification!.title} ${event.notification!.body}";
      });
    });

    // background State
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      setState(() {
        notificationMsg =
            "${event.notification!.title} ${event.notification!.body} ";
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: 'Notifications'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       
          children :
        [ Padding(  padding: const EdgeInsets.all(7.0),
        
          child :Text("Notifications" ,style: h2, ),),
        SizedBox(height: 20,),
        Text("Nerver miss a message , click the link below to easily enable notifications from us " ,style: h7, ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children :[
             Container(

height: 50 ,
width: 450 ,
    decoration: BoxDecoration(
    border: Border.all(
      color :GREY, //                  
      width: 0.5,
    ) ,
   borderRadius: BorderRadius.all(
        Radius.circular(5.0) //
    ),), 
    child: new InkWell(
          onTap: () {
            //  Navigator.push( context,MaterialPageRoute(builder: (context) => Orders()));
     FirebaseMessaging.instance.subscribeToTopic ('news');   
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10 ,top: 7.0),
            child: Text("Open Notification settings",style: TextStyle(fontSize: 14 , color: COLOR_PRIMARY),),
          ),
          ),
        ),]),
                ),
 
      ]
        ),
      
    );
  }
}
