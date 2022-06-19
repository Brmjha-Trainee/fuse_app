import 'package:easy_localization/easy_localization.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import '../translations/locale_keys.g.dart';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import '../services/local_notifications.dart';

class Notification1 extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

// class _NotificationState extends State<Notification1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: myAppBar(context, title: LocaleKeys.notification.tr()),
//     );
//   }
// }

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
      appBar: AppBar(title: Text('Notification')),
      body: Center(
        child: Text(notificationMsg),
      ),
    );
  }
}
