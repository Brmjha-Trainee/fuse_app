import 'package:flutter/material.dart';
import 'package:fuseapp/utils/forms_validations.dart';
import 'package:fuseapp/views/login.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'dart:async';
import 'package:fuseapp/view_model/auth_services.dart';
import 'package:provider/provider.dart';

class Signup3 extends StatefulWidget {
  @override
  State<Signup3> createState() => _Signup3State();
}

class _Signup3State extends State<Signup3> {
  //FixMe ASMAA use provider + pass controller to textfields + add validation +form key
  //checkBoxes
  bool value = false;
  // Initially password is obscure
  bool _obscureText = true;
  // Toggles the password show status
  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
//FixMe ASMAA already done "for you to learn " there was rendring issue fixed
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0, top: 80),
                child: Text(
                  'Create new account',
                  style: h1,
                ),
              ),
              Form(
                // key: _formKey,
                child: Column(
                  children: <Widget>[
                    inputText(
                      label: "Name",
                      hintText: 'Your name',
                    ),
                    inputText(
                      label: "Email",
                      hintText: 'example@gmail.com',
                      validation: emailValidation,
                      controller: emailController,
                    ),
                    //FixMe ASMAA not showing the picked date please use on change" + field should be read only
                    inputText(
                        label: "Birthday",
                        hintText: '10-May-2022',
                        iconButton: IconButton(
                            onPressed: () {
                              _selectDate(context);
                            },
                            icon: Icon(Icons.date_range_outlined))),
                    inputText(
                      label: 'Password',
                      validation: passwordValidation,
                      controller: passwordController,
                      hintText: '*******',
                      obscureText: _obscureText,
                      iconButton: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: _togglePasswordStatus,
                      ),
                    ),
                    inputText(
                      label: 'Confirm Password',
                      hintText: '*******',
                      obscureText: _obscureText,
                      iconButton: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: _togglePasswordStatus,
                      ),
                    ),
                    //FIXME ASMAA provider instead of setstate + Onclick don't sent to login Write the name of the write screen
                    Row(
                      children: [
                        Checkbox(
                          value: value,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                                text: 'I agree to Its',
                                style: h6,
                                children: <TextSpan>[
                                  linkText(
                                      label: ' privacy policy',
                                      pageName: LoginScreen(),
                                      context: this.context),
                                  TextSpan(text: ' and', style: h6),
                                  linkText(
                                      label: ' terms of use',
                                      pageName: LoginScreen(),
                                      context: this.context),
                                ]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              darkBtn(
                label: 'Create Account',
                onPressed: () async {
                  //FixMe Haneen  Check validation first
                  await authService.createuserWithEmaliandpassward(
                      emailController.text, passwordController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  richText(
                    context: this.context,
                    label_1: 'Already have an account',
                    label_2: ' Login',
                    pageName: LoginScreen(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
