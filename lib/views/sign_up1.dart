import 'package:flutter/material.dart';
import 'package:fuseapp/views/login.dart';
import 'package:fuseapp/theme/theme_constants.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Form(
                      // key: _formKey,
                      child: Column(
                        children: <Widget>[
                          inputText(label: "Name", hintText: 'Your name'),
                          inputText(
                              label: "Email", hintText: 'example@gmail.com'),
                          inputText(label: "Birthday", hintText: '10-May-2022'),
                          inputText(
                            label: 'Password',
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
                      context: this.context,
                      pageName: LoginScreen(),
                    ),
                    Flexible(
                      child: richText(
                        context: this.context,
                        label_1: 'Already have an account',
                        label_2: ' Login',
                        pageName: LoginScreen(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
