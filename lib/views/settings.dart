import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/routers/routing_constants.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:provider/provider.dart';

import '../services/auth_services.dart';
import '../translations/locale_keys.g.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
        appBar: myAppBar(context, title: LocaleKeys.edit.tr()),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.language_outlined, color: COLOR_PRIMARY),
              title: Text(LocaleKeys.languages.tr()),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(context, LanguageViewRoute);
              },
            ),
            Divider(
              color: LIGHT_GREY,
              height: 1.0,
            ),
            ListTile(
                leading:
                    Icon(Icons.notifications_outlined, color: COLOR_PRIMARY),
                title: Text(LocaleKeys.notifications.tr()),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, Notification1ViewRoute);
                }),
            Divider(
              color: LIGHT_GREY,
              height: 1.0,
            ),
            ListTile(
                leading: Icon(Icons.lock_outline, color: COLOR_PRIMARY),
                title: Text(LocaleKeys.reset_password.tr()),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, ForgetPass1ViewRoute);
                }),
            Divider(
              color: LIGHT_GREY,
              height: 1.0,
            ),
            SizedBox(height: 60),
            ListTile(
                leading: Icon(
                  Icons.logout_outlined,
                  color: COLOR_PRIMARY,
                ),
                title:
                    Text(LocaleKeys.logout.tr(), style: TextStyle(color: RED)),
                onTap: () async {
                  await authService.signOut();
                }),
            Divider(
              color: LIGHT_GREY,
              height: 1.0,
            ),
          ],
        ));
  }
}
