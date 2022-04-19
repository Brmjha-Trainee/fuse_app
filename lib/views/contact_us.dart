import 'package:flutter/material.dart';
import '../theme/theme_constants.dart';
import '../utils/forms_validations.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: 'Contact Us'),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              emailField(),
              subjectField(),
              textAreaField(),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                        }
                      },
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
              ),
              dividerWithText(),
              phoneText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget textAreaField() {
    return textAreaInput(
      label: 'Message',
      hintText: 'Enter your message',
      controller: _messageController,
      validation: (val) {
        return validateTextArea(_messageController.text.trim());
      },
    );
  }

  Widget subjectField() {
    return inputText(
      label: 'Subject',
      hintText: 'Enter your new subject',
      keyboardType: TextInputType.text,
      controller: _subjectController,
      validation: (val) {
        return validateSubject(_subjectController.text.trim());
      },
    );
  }

  Widget emailField() {
    return inputText(
        label: 'Email',
        hintText: 'Enter your Email',
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
        validation: (val) {
          return validateEmail(_emailController.text.trim());
        });
  }

  Widget phoneText() {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.phone_outlined,
            color: COLOR_PRIMARY,
          ),
          Text(
            '+96650101010',
            style: h3,
          ),
        ],
      ),
    );
  }

  Widget dividerWithText() {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Row(children: <Widget>[
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
                color: GREY,
                height: 36,
              )),
        ),
        Text(
          "OR",
          style: h7,
        ),
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Divider(
                color: GREY,
                height: 36,
              )),
        ),
      ]),
    );
  }
}
