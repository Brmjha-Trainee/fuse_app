import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

class Notification extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification1> {
  @override
  String notificationMsg = "Waiting for notification";
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
