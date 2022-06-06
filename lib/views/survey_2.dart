import 'dart:collection';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/providers/ordersprovider.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:provider/provider.dart';
import '../providers/feedback_provider.dart';
import '../translations/locale_keys.g.dart';
import '../view_model/survey_vm.dart';

class Survey2 extends StatefulWidget {
  const Survey2({Key? key}) : super(key: key);

  @override
  State<Survey2> createState() => _Survey2State();
}

class _Survey2State extends State<Survey2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<SurveyChoices> choices = [
    SurveyChoices('Wider product selection'),
    SurveyChoices('Better shipping options'),
    SurveyChoices('Easier return process'),
    SurveyChoices('More brands options'),
  ];
  SurveyChoices? choice;
  HashSet<SurveyChoices> selectedItem = HashSet();
  bool isMultiSelectionEnabled = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar3(context),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(children: <Widget>[
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
          //choices(),
          ListView(
            shrinkWrap: true,
            children: choices.map((SurveyChoices choice) {
              return Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: COLOR_PRIMARY, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: getListItem(choice),
              );
            }).toList(),
          ),
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
                      doMultiselection(choice!);
                    },
                    child: Text(LocaleKeys.send.tr()),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  AnimatedContainer getListItem(SurveyChoices choice) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color:
            selectedItem.contains(choice) ? COLOR_PRIMARY : Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      duration: Duration(milliseconds: 100),
      child: ListTile(
          title: Text(
            choice.choiceText!,
            style: h1.copyWith(
              fontSize: 21,
              color: selectedItem.contains(choice) ? WHITE : COLOR_PRIMARY,
            ),
            textAlign: TextAlign.center,
          ),
          onTap: () {
            choice.isSelected = true;
            doMultiselection(choice);
          }),
    );
  }

  void doMultiselection(SurveyChoices choice) {
    if (choice.isSelected) {
      if (selectedItem.contains(choice)) {
        selectedItem.remove(choice);
      } else {
        selectedItem.add(choice);
      }
      setState(() {
        print(choice.choiceText);
        Provider.of<FeedBackProvider>(context, listen: false)
            .sendSelectedChoicesToDB(context, choice);
      });
      //
    } else {
      //Other logic
    }
  }
}
