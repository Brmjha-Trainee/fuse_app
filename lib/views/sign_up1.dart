import 'package:flutter/material.dart';
import 'package:fuseapp/utils/forms_validations.dart';
import 'package:fuseapp/views/login.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/views/sign_up3.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'SA');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0, top: 50),
                child: Text(
                  'Create new account',
                  style: h1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Phone Number',
                  style: h3,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                              color: WHITE,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: LIGHT_GREY),
                            ),
                            child: Stack(
                              children: [
                                phoneNumberField(),
                                Positioned(
                                  left: 90,
                                  top: 8,
                                  bottom: 8,
                                  child: Container(
                                    height: 40,
                                    width: 1,
                                    color: COLOR_PRIMARY,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: darkBtn(
                              label: 'Next',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Signup3(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
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

  InternationalPhoneNumberInput phoneNumberField() {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        print(number.phoneNumber);
      },
      validator: (val) {
        return validatePhone(phoneController.text);
      },
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      initialValue: number,
      textFieldController: phoneController,
      formatInput: false,
      maxLength: 9,
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: true),
      inputDecoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 15, left: 0),
        border: InputBorder.none,
        hintText: '5xxxxxxx',
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
      ),
      inputBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: LIGHT_GREY,
        ),
      ),
      onSaved: (PhoneNumber number) {
        print('On Saved: $number');
      },
    );
  }
}
