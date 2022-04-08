import 'package:flutter/material.dart';
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

  //FixMe ASMAA use provider
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
// Initially password is obscure
  bool _obscureText2 = true;
  // Toggles the password show status
  void _togglePasswordStatus2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

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
        child: SingleChildScrollView(
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
                child: Column(
                  children: <Widget>[
                    nameField(),
                    emailField(),
                    birthField(),
                    passField(),
                    confirmPassField(),
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

  Widget confirmPassField() {
    return inputText(
      label: 'Confirm Password',
      hintText: '*******',
      obscureText: _obscureText2,
      controller: confirmPassController,
      validation: (dynamic val) {
        if (val.isEmpty) {
          return "This field is required";
        }
        return confirmPassValidation.validateMatch(val, passController.text);
      },
      iconButton: IconButton(
        icon: Icon(
          _obscureText2 ? Icons.visibility_off : Icons.visibility,
        ),
        onPressed: _togglePasswordStatus2,
      ),
    );
  }

  Widget passField() {
    return inputText(
      label: 'Password',
      hintText: '*******',
      controller: passController,
      validation: (val) {
        return validatePass(passController.text);
      },
      obscureText: _obscureText,
      iconButton: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
        ),
        onPressed: _togglePasswordStatus,
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
          return requiredField(dateController.text);
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
