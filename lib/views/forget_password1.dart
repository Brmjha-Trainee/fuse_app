//UI rawabi, BE missing faizah
import 'package:flutter/material.dart';
import 'forget_password2.dart';
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
        appBar: AppBar(
          title: Text(
            'Reset Password',
          ),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
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
                    // the sized is for adding spaces
                    SizedBox(
                      height: 28,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
//fixme rawabi please use the text fields, and button in the theme "Take help from asmaa
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Enter your email'),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          //todo faizah check db users the navigate to next page or show validation error
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ResetPasswordPage2()),
                          );
                        },
                        child: Text('Send')),
                  ],
                ),
              ),
            ]));
  }
}
