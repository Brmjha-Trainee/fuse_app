import 'package:flutter/material.dart';
import 'package:fuseapp/views/sign_up1.dart';
import 'package:fuseapp/theme/theme_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      body: SafeArea(
        child: Container(
          //double infinity make it big as parents allows
          //while mediQuery make it big as per the screen
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/logo.png'),
                  ),
                ),
              ),
              Column(
                children: [
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        inputText(
                          label: 'Email',
                          hintText: 'example@gmail.com',
                        ),
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
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: h3.copyWith(fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  darkBtn( label: 'Login')
                ],
              ),
              richText(
                context: this.context,
                label_1: 'New Member',
                label_2: ' create new account',
                pageName: SignupPage(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
