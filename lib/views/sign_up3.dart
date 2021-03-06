import 'package:flutter/material.dart';
import 'package:fuseapp/providers/show_hide_pass_provider.dart';
import 'package:fuseapp/utils/forms_validations.dart';
import 'package:fuseapp/views/login.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/view_model/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Signup3 extends StatefulWidget {
  @override
  State<Signup3> createState() => _Signup3State();
}

class _Signup3State extends State<Signup3> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //checkBoxes

  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 80),
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
                      controller: passController,
                      validation: (val) {
                        return validatePass(passController.text);
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
                      controller: confirmPassController,
                      validation: (dynamic val) {
                        if (val.isEmpty) {
                          return "This field is required";
                        }
                        return confirmPassValidation.validateMatch(
                            val, passController.text);
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
                    // FIXME ASMAA provider instead of setstate + Onclick don't sent to login Write the name of the write screen
                    Row(
                      children: [
                        Checkbox(
                          value: toggle.checkBoxValue,
                          onChanged: (bool? value) {
                            toggle.isCheck();
                          },
                        ),
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
              }),
            ),
            darkBtn(
              label: 'Create Account',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  await authService.createuserWithEmaliandpassward(
                      emailController.text, passController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                }
                //FixMe Haneen  Check validation first
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
      ),
    );
  }

  Widget birthField() {
    return inputText(
        label: 'Birth Date',
        hintText: '22-04-2022',
        readOnly: true,
        controller: dateController,
        validation: (val) {
          return validateRequiredField(dateController.text);
        },
        iconButton: IconButton(
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(
                    2000), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101));

            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('dd-MM-yyyy').format(pickedDate);
              setState(() {
                dateController.text =
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
      controller: emailController,
      validation: (val) {
        return validateEmail(emailController.text);
      },
    );
  }

  Widget nameField() {
    return inputText(
        label: "Name",
        hintText: 'Your name',
        controller: nameController,
        validation: (val) {
          return validateName(nameController.text);
        });
  }
}
