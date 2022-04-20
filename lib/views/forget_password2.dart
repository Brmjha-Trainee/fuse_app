//UI rawabi, BE fiazah
import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';

class ResetPasswordPage2 extends StatefulWidget {
  const ResetPasswordPage2({
    Key? key,
  }) : super(key: key);

  @override
  _ResetPasswordPageState2 createState() => _ResetPasswordPageState2();
}

class _ResetPasswordPageState2 extends State<ResetPasswordPage2> {
  bool showPassword = true;
  bool showConfirmPassword = true;
//Fixme rawabi use the theme created by asmaa
  //fixme fiazah store new password in DB on success redirect to login page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: myAppBar(context, title: 'Reset Password'),
      body: Container(
        padding: const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'New password',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: showPassword,
              decoration: InputDecoration(
                hintText: 'Enter password',
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () => setState(() => showPassword = !showPassword),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Confirm password',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: showConfirmPassword,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () => setState(
                      () => showConfirmPassword = !showConfirmPassword),
                ),
              ),
            ),
            SizedBox(
              height: 28,
            ),
            darkBtn(onPressed: () {}, label: "Reset password"),
          ],
        ),
      ),
    );
  }
}
