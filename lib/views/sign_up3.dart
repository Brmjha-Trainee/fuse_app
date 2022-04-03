import 'package:flutter/material.dart';
import 'package:fuseapp/views/login.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'dart:async';

class Signup3 extends StatefulWidget {
  @override
  State<Signup3> createState() => _Signup3State();
}

class _Signup3State extends State<Signup3> {
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
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
