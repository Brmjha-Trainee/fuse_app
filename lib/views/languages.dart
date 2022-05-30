import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/utils/forms_validations.dart';
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
    final List<String> languageItems = [
      'English',
      'العربية',
    ];
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: myAppBar(context, title: LocaleKeys.languages.tr()),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.language.tr(),
                style: h3,
              ),
              SizedBox(height: 5),
              DropdownButtonFormField2(
                decoration: InputDecoration(
                  //Add isDense true and zero Padding.
                  //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: BLUISH_GRERY,
                    ),
                  ),
                  //Add more decoration as you want here
                  //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                ),
                isExpanded: true,
                value: selectedValue,
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black45,
                ),
                iconSize: 30,
                buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                items: languageItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item, style: h4),
                        ))
                    .toList(),
                validator: (value) {
                  validateDropDown(value);
                  return null;
                },
                onChanged: (value) {
                  selectedValue = value.toString();
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        if (selectedValue == 'English') {
                          await context.setLocale(Locale('en'));
                        } else {
                          await context.setLocale(Locale('ar'));
                        }
                      }
                    },
                    child: Text(LocaleKeys.save.tr()),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      _formKey.currentState?.reset();
                    },
                    child: Text(LocaleKeys.cancel.tr()),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
