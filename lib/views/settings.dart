import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/views/forget_password1.dart';
import 'package:fuseapp/views/notifications.dart';
import 'package:fuseapp/views/sign_options.dart';
import 'package:settings_ui/settings_ui.dart';

import 'languages.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}
class _SettingsScreenState extends State<SettingsScreen> {
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Setting'),),
      body :ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.language_outlined,color:COLOR_PRIMARY),
            title: Text('Languages'),
             trailing: Icon(Icons.keyboard_arrow_right),
             onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                     LanguagesScreen()),
                          );} ,
          ),
           Divider(color: LIGHT_GREY ,
          height:1.0 ,),
          ListTile(
            leading: Icon(Icons.notifications_outlined,color:COLOR_PRIMARY),
            title: Text('Notifications'),
             trailing: Icon(Icons.keyboard_arrow_right),
               onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Notification1()),
                          );} 
          ),
          Divider(color: LIGHT_GREY ,
           height:1.0 ,),
          ListTile(
            leading: Icon(Icons.lock_outline,color:COLOR_PRIMARY),
            title: Text('Reset password'),
            trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPasswordPage()),
                          );} 
          ),
          Divider(color: LIGHT_GREY ,
          height:1.0 ,),
          SizedBox(height:60),
          ListTile(
            leading: Icon(Icons.logout_outlined ,color: COLOR_PRIMARY,),
            title: Text('Log out',style :TextStyle(color : RED)),
              onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignOption()),
                          );} 
          ),
          Divider(color: LIGHT_GREY ,
           height:1.0 ,),
        ],
      ));
    }
      
} 
    
