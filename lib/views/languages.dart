import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:easy_localization/easy_localization.dart';

import '../translations/locale_keys.g.dart';

class LanguagesScreen extends StatefulWidget {
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  static String? selectedValue = 'English';
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: myAppBar(context, title: LocaleKeys.languages.tr()),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          width: double.infinity,
          child: languageDropDowninput(
            context: context,
            value: selectedValue,
            formKey: _formKey,
            languageItems: ['English', 'العربية'],
          )),
    );
  }
}
