//UI Rawabi, BE Faizah (NOT YET DONE)
import 'package:flutter/material.dart';
import 'package:fuseapp/routers/routing_constants.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'dart:async';

class CreateAccount extends StatefulWidget {
  late final PhoneNumber number;
  //  CreateAccount( PhoneNumber number ) { this.number = number ;}

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  late Timer _timer;
  int _start = 60;
//a timer method
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {});
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  initState() {
    startTimer();
    super.initState();
  }

  @override
  dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar(context, title: 'Create Account'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              SizedBox(
                height: 28,
              ),
              //(done)  //Fixme rawabi pass the phone number as argument from sign_up1 and show it here instead of 05xxxx
              Text(
                "We send a code to " +
                    widget.number.toString() +
                    "Enter the code below",
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: 28,
              ),
              //opt section
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(28),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _textFieldOTP(first: true, last: false),
                          _textFieldOTP(first: false, last: false),
                          _textFieldOTP(first: false, last: false),
                          _textFieldOTP(first: false, last: true),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Code will Expire after  $_start"),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Didn't recieve ?",
                              ),
                              InkWell(
                                splashColor: LIGHT_GREY,
                                onTap: () {
                                  setState(() {
                                    _start = 60;
                                  });
                                },
                                child: Text(
                                  ' send again',
                                  style: TextStyle(
                                      color: COLOR_PRIMARY,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )),
                      darkBtn(
                        label: 'Next',
                        onPressed: () {
                          //done -Fixme rawabi redirect to signup3
                          Navigator.pushReplacementNamed(
                              context, SignUp3ViewRoute);
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                  margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already Register?",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          )),
                      InkWell(
                        splashColor: LIGHT_GREY,
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, LoginViewRoute);
                          //done-fixme rawabi redirect to login page
                        },
                        child: Text(
                          ' Login',
                          style: TextStyle(
                              color: COLOR_PRIMARY,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({required bool first, last}) {
    return Container(
      height: 50,
      width: 50,
      child: Material(
        elevation: 10,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(8),
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(border: InputBorder.none),
        ),
      ),
    );
  }
}
