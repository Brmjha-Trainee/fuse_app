//UI rawabi, BE missing faizah
import 'package:flutter/material.dart';
import 'package:fuseapp/routers/routing_constants.dart';
import 'package:fuseapp/theme/theme_constants.dart';

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
        appBar: myAppBar(context, title: 'Reset Password'),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Enter your e-mail adress and we’ll send you a link to reset your password ',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    // the size is for adding spaces
                    SizedBox(
                      height: 28,
                    ),
//done -fixme rawabi please use the text fields, and button in the theme "Take help from asmaa
                    inputText(label: 'Email', hintText: 'Enter your email'),

                    SizedBox(
                      height: 28,
                    ),
                    darkBtn(
                        onPressed: () {
                          //todo faizah check db users the navigate to next page or show validation error
                          Navigator.pushReplacementNamed(
                              context, ForgetPass2ViewRoute);
                        },
                        label: "Send"),
                  ],
                ),
              ),
            ]));
  }
}
