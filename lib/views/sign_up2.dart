import 'package:flutter/material.dart';
//import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'dart:async';
import 'forget_password1.dart';


class CreateAccount extends StatefulWidget {

  const CreateAccount({
    Key? key,
  }) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
  
}

class _CreateAccountState extends State<CreateAccount> {
  late Timer _timer;
  int _start = 60;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
       appBar: AppBar(
       title: Text('Create Account',),
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
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(12),
  
                // ),
       
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
                         
                    Text(
                       
                   "Resend after 00:"+_start.toString(),
                   style: TextStyle(
                     fontSize: 14,
                   ),),
                    SizedBox(
                      height: 22,
                    ),
                
                 //Text ((  Timer( (Duration(seconds: 60))))),
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
              startTimer();
            //             Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const HomePage()),
            // );
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
                      style: TextStyle(
            decoration: TextDecoration.underline,
          )
                    ),
                    InkWell(
                      splashColor:LIGHT_GREY,
                 onTap: () {
            //             Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const HomePage()),
            // );
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

  Widget _textFieldOTP({required bool first, last}) {
    return Container (
     
      
      height: 50,
      width: 50 ,
  
      child: Material(
        elevation: 10,shadowColor:Colors.black,
        child: TextField(
          // autofocus: true,
          //  onChanged: (value) {
          //    if (value.length == 1 && last == false) {
          //      FocusScope.of(context).nextFocus();
                
          //    }
          //    if (value.length == 0 && first == false) {
          //      FocusScope.of(context).previousFocus();
               
          //    }
          //  },
           showCursor: false,
           readOnly: false,
           textAlign: TextAlign.center,
           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
           keyboardType: TextInputType.number,
         ),
      ),
    );
  }


} 
