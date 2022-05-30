//UI rawabi, BE missing faizah
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/routers/routing_constants.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/translations/locale_keys.g.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({
    Key? key,
  }) : super(key: key);
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: myAppBar(context, title: LocaleKeys.reset_password.tr()),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      LocaleKeys.forget_pass_1_paragragh.tr(),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    // the size is for adding spaces
                    SizedBox(
                      height: 28,
                    ),
//done -fixme rawabi please use the text fields, and button in the theme "Take help from asmaa
                    inputText(
                        label: LocaleKeys.email.tr(),
                        hintText: LocaleKeys.email_hint_text),

                    SizedBox(
                      height: 28,
                    ),
                    darkBtn(
                        onPressed: () {
                          //todo faizah check db users the navigate to next page or show validation error
                          Navigator.pushReplacementNamed(
                              context, ForgetPass2ViewRoute);
                        },
                        label: LocaleKeys.send.tr()),
                  ],
                ),
              ),
            ]));
  }
}
