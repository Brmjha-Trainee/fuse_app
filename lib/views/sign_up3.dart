//UI Asmaa, BE Haneen
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/components/snack_bar.dart';
import 'package:fuseapp/utils/forms_validations.dart';
import 'package:fuseapp/views/login.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/toggle_text.dart';

class Signup3 extends StatefulWidget {
  @override
  State<Signup3> createState() => _Signup3State();
}

class _Signup3State extends State<Signup3> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //FixMe ASMAA use provider DONE

  @override
  void initState() {
    _dateController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    ScaffoldMessengerKey:
    Utils.messsengerKey;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0, top: 80),
            child: Text(
              'Create new account',
              style: h1,
            ),
          ),
          Form(
              key: _formKey,
              child: Consumer<ToggleText>(builder: (context, toggle, _) {
                return Column(
                  children: <Widget>[
                    nameField(),
                    emailField(),
                    birthField(),
                    inputText(
                      label: 'Password',
                      hintText: '*******',
                      controller: _passController,
                      keyboardType: TextInputType.visiblePassword,
                      validation: (val) {
                        return validatePass(_passController.text.trim());
                      },
                      obscureText: toggle.obscureText1,
                      iconButton: IconButton(
                        icon: Icon(
                          toggle.obscureText1
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          toggle.togglePasswordStat1();
                        },
                      ),
                    ),
                    inputText(
                      label: 'Confirm Password',
                      hintText: '*******',
                      obscureText: toggle.obscureText2,
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
                          toggle.obscureText2
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          toggle.togglePasswordStat2();
                        },
                      ),
                    ),
                    // FIXME ASMAA provider instead of setstate + Onclick don't sent to login Write the name of the write screen  DONE
                    Row(
                      children: [
                        Checkbox(
                          value: toggle.checkBoxValue,
                          onChanged: (bool? value) {
                            toggle.isCheck();
                          },
                        ),
                        //Todo Later on this is will be clickable
                        RichText(
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
                      ],
                    )
                  ],
                );
              })),
          darkBtn(
            label: 'Create Account',
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                 await authService
                    .createUserWithEmailAndPassword(
                        _emailController.text, _passController.text, context)
                    .then((value) => FirebaseFirestore.instance
                            .collection('Users')
                            .doc(value?.uid)
                            .set({

                          "name": _nameController.text,
                          "email": _emailController.text.trim(),
                          "date": _dateController.text.trim(),
                        }));
              }
              //FixMe Haneen  Check validation first (Done)
            },
          ),
          Expanded(
            child: Row(
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
          ),
        ],
      ),
    ));
  }

  Widget birthField() {
    return inputText(
        label: 'Birth Date',
        hintText: '22-04-2010',
        readOnly: true,
        controller: _dateController,
        validation: (val) {
          return validateRequiredField(_dateController.text);
        },
        iconButton: IconButton(
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              //DateTime.now() - not to allow to choose before today.
              initialDate: DateTime.now(),
              firstDate: DateTime(1990),
              lastDate: DateTime(2101),
            );

            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('dd-MM-yyyy').format(pickedDate);
              setState(() {
                _dateController.text =
                    formattedDate; //set output date to TextField value.
              });
            }
          },
          icon: Icon(Icons.date_range),
        ));
  }

  Widget emailField() {
    return inputText(
      label: "Email",
      hintText: 'example@gmail.com',
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      validation: (val) {
        return validateEmail(_emailController.text.trim());
      },
    );
  }

  Widget nameField() {
    return inputText(
      label: "Name",
      hintText: 'Your name',
      keyboardType: TextInputType.name,
      controller: _nameController,
      validation: (val) {
        return validateName(_nameController.text);
      },
    );
  }
}
