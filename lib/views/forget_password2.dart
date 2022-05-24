//UI rawabi, BE fiazah
import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:provider/provider.dart';
import '../providers/toggle_text.dart';
import '../utils/forms_validations.dart';
class ResetPasswordPage2 extends StatefulWidget {
  const ResetPasswordPage2({
    Key? key,
  }) : super(key: key);

  @override
  _ResetPasswordPageState2 createState() => _ResetPasswordPageState2();
}
class _ResetPasswordPageState2 extends State<ResetPasswordPage2> {
  final TextEditingController _passController = TextEditingController();
    final TextEditingController _confirmPassController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//done -Fixme rawabi use the theme created by asmaa
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
  Form(
              key: _formKey,
              child: Consumer<ToggleText>(builder: (context, toggle, _) {
                return Column(
                  children: <Widget>[
                   
                    inputText(
                      label: 'New password',
                      hintText: 'Enter your password',
                      controller: _passController,
                      keyboardType: TextInputType.visiblePassword,
                      validation: (val) {
                        return validatePass(_passController.text.trim());
                      },
                      obscureText: toggle.obscureText3,
                      iconButton: IconButton(
                        icon: Icon(
                          toggle.obscureText3
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          toggle.togglePasswordStat3();
                        },
                      ),
                    ),
                    inputText(
                      label: 'Confirm Password',
                      hintText: 'Enter your password',
                      obscureText: toggle.obscureText4,
                      controller: _confirmPassController,
                      validation: (dynamic val) {
                        if (val.isEmpty) {
                          return "This field is required";
                        }
                        return confirmPassValidation.validateMatch(
                            val, _passController.text.trim());
                      },
                      iconButton: IconButton(
                        icon: Icon(
                          toggle.obscureText4
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          toggle.togglePasswordStat4();
                        },
                      ),
                    ),
            SizedBox(
              height: 28,
            ),
            darkBtn(onPressed: () {}, label: "Reset password"),
          ],

        );}))])));}
}
