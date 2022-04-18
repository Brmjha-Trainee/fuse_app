import 'package:flutter/material.dart';

import '../theme/theme_constants.dart';
class Settings extends StatefulWidget {
  const Settings({ Key? key }) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: 'Settings'),
      body: Center(
        child: Text('tgbe'),
      ),
    );
  }
}