import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../utils/forms_validations.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'SA');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: 'Personnal Information'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/img/avatar.png',
                    width: 100.0,
                    height: 100.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        color: COLOR_PRIMARY,
                      ),
                      Text(
                        'Edit',
                        style: h4,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          nameField(),
                          emailField(),
                          phoneField(),
                          birthField(),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Save'),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text('Cancel'),
                                )
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return inputText(
      label: 'Email',
      hintText: 'example@gmail.com',
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validation: (val) {
        return validateEmail(_emailController.text.trim());
      },
    );
  }

  Widget nameField() {
    return inputText(
      label: 'Name',
      hintText: 'Your name',
      keyboardType: TextInputType.name,
      controller: _nameController,
      validation: (val) {
        return validateName(_nameController.text);
      },
    );
  }

  Widget phoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: h3,
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: WHITE,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: BLUISH_GRERY),
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
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget phoneNumberField() {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        print(number.phoneNumber);
      },
      validator: (val) {
        return validatePhone(_phoneController.text);
      },
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      initialValue: number,
      textFieldController: _phoneController,
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
          color: BLUISH_GRERY,
        ),
      ),
      onSaved: (PhoneNumber number) {
        print('On Saved: $number');
      },
    );
  }

  Widget birthField() {
    return inputText(
        label: 'Date of Birth',
        hintText: '22-04-2010',
        keyboardType: TextInputType.datetime,
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
          icon: Icon(
            Icons.date_range,
            color: COLOR_PRIMARY,
          ),
        ));
  }
}
