import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:fuseapp/views/login.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/views/sign_up3.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
=======
import 'package:fuseapp/view_model/auth_services.dart';
import 'package:fuseapp/views/login.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:provider/provider.dart';
>>>>>>> Stashed changes

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
<<<<<<< Updated upstream
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'SA');

  @override
  Widget build(BuildContext context) {
=======
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
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<AuthService>(context);

>>>>>>> Stashed changes
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
<<<<<<< Updated upstream
          padding: EdgeInsets.symmetric(horizontal: 20),
=======
          padding: EdgeInsets.symmetric(horizontal: 40),
>>>>>>> Stashed changes
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
<<<<<<< Updated upstream
                padding: const EdgeInsets.only(bottom: 30.0, top: 80),
=======
                padding: const EdgeInsets.only(bottom: 30.0, top: 30),
>>>>>>> Stashed changes
                child: Text(
                  'Create new account',
                  style: h1,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
<<<<<<< Updated upstream
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              print(number.phoneNumber);
                            },
                            onInputValidated: (bool value) {
                              print(value);
                            },
                            //validator: ,
                            selectorConfig: SelectorConfig(
                              selectorType: PhoneInputSelectorType.DIALOG,
                            ),
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.disabled,

                            initialValue: number,
                            textFieldController: controller,
                            formatInput: false,
                            inputDecoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: LIGHT_GREY,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            inputBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: LIGHT_GREY,
                              ),
                            ),
                            onSaved: (PhoneNumber number) {
                              print('On Saved: $number');
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          darkBtn(
                            label: 'Next',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Signup3(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
=======
                    Column(
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
                            RichText(
                              text: TextSpan(
                                  text: 'I agree to ItsLinkey',
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
                    ),
                    darkBtn(
                      label: 'Create Account',
                      context: this.context,
                      pageName: LoginScreen(),
>>>>>>> Stashed changes
                    ),
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
      ),
    );
  }
}
