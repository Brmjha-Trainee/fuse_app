import 'package:flutter/material.dart';
//import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'Sign_up1.dart';
import 'home_page.dart';



class CreateAccount extends StatefulWidget {
  const CreateAccount({
    Key? key,
  }) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // I added this app because the default theme wont show the back arrow
       appBar: AppBar(
       title: Text('Creat Account',),
          iconTheme: IconThemeData(
    color: Colors.black, //change your color here
  ),
  ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              SizedBox(
                height: 28,
              ),
              
              Text(
                "We send a code to 05XXXXXXXX. Enter the code below",
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: 28,
              ),
              Container(
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
  
                ),
                // opt field to input the code sent on the phone number
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
                      height: 22,
                    ),
                   //for creating a clickable link
                    Container(
                margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Didn't recieve ?",
                    ),
                    InkWell(
                      splashColor:LIGHT_GREY,
                      onTap: () {
                        Navigator.push(
              context,
              //made transfer to the home to insure that my code works
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
;
                      },
                      child: Text(
                        ' send again',
                        style: TextStyle(
                            color: COLOR_PRIMARY,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ))                 
          , SizedBox(
                      height: 22,
                    ),
                    ElevatedButton( onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ResetPasswordPage()),
            );}, child: Text('Next')),
                  ],
                ),
              ),
              SizedBox(
                height:50,
              ), 
               Container(
                margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already Register?",
                    ),
                    InkWell(
                      splashColor:LIGHT_GREY,
                      onTap: () {
                        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
;
                      },
                      child: Text(
                        ' Login',
                        style: TextStyle(
                            color: COLOR_PRIMARY,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ))                 
          ,
            ],
          ),
        ),
      ),
    );
  }
