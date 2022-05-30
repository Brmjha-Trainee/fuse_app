import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';

import '../translations/locale_keys.g.dart';

class Notification1 extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: LocaleKeys.notification.tr()),
    );
  }
}
