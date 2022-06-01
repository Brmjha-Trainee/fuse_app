import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';

import '../translations/locale_keys.g.dart';

class Survey2 extends StatefulWidget {
  const Survey2({Key? key}) : super(key: key);

  @override
  State<Survey2> createState() => _Survey2State();
}

class _Survey2State extends State<Survey2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedChoice = "";
  bool isSelected = false;
  int _selectedIndex = -1;
  List<String> _choices = [
    'Wider product selection',
    'Better shipping options',
    'Easier return process',
    'More brands options'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar3(context),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(children: [
            Text(
              'Help us help you.\nwhat we can do better?',
              style: subtitle2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Select one or more option',
              style: h2.copyWith(color: IN_BETWEEN_GREY),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            choices(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Back'),
                    ),
                    SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                        }
                      },
                      child: Text(LocaleKeys.send.tr()),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget choices() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _choices.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: COLOR_PRIMARY, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? COLOR_PRIMARY
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  duration: Duration(milliseconds: 100),
                  child: ListTile(
                    title: Text(
                      _choices[index],
                      style: h1.copyWith(
                        fontSize: 21,
                        color: _selectedIndex == index ? WHITE : COLOR_PRIMARY,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () => setState(() {
                      _selectedIndex = index;
                    }),
                  ),
                ),
              ),
            ],
          );
        });
  }

  // Widget choiceChips() {
  //   return Expanded(
  //     child: ListView.builder(
  //       itemCount: _choices.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return ChoiceChip(
  //           label: Text(_choices[index]),
  //           selected: selectedChoice == _choices[index],
  //           selectedColor: COLOR_PRIMARY,
  //           onSelected: (selected) {
  //             setState(() {
  //               isSelected = selected;
  //             });
  //           },
  //           side: BorderSide(color: COLOR_PRIMARY),
  //           backgroundColor: WHITE,
  //           labelStyle: TextStyle(color: BLACK),
  //         );
  //       },
  //     ),
  //   );
  // }
}
