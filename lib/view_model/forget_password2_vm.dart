import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';

import 'forget_password1_vm.dart';
//import 'home_page.dart';

class ResetPasswordPage2 extends StatefulWidget {
   const  ResetPasswordPage2({
    Key? key,
  }) : super(key: key);
  @override
  _ResetPasswordPageState2 createState() => _ResetPasswordPageState2();
}

class _ResetPasswordPageState2 extends State<ResetPasswordPage2> {

  bool showPassword = true;
  bool showConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
           iconTheme: IconThemeData(
    color: Colors.black, //change your color here
  ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Align(
              alignment: Alignment.centerLeft,
              child :Text('New password' , style: Theme.of(context).textTheme.bodyText1,textAlign:TextAlign.left,),),
               SizedBox(
                height: 10,
              ),
            TextField(
              obscureText: showPassword,
              decoration: InputDecoration(
                hintText: 'Enter password',
                // this item enable the user to hide and show his password
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
              child :Text('Confirm password' , style: Theme.of(context).textTheme.bodyText1,),),
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
   ElevatedButton(onPressed: () { //Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const HomePage()),
             //);
   }, child: Text('Reset password')),
          ],),),);}}
