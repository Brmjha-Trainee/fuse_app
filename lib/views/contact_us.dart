import 'package:flutter/material.dart';
import '../theme/theme_constants.dart';
import '../utils/forms_validations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  Future sendEmail() async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const serviceId = 'service_cbryeek';
    const templateId = 'template_6txkti4';
    const userId = 'k_Gqs95QVm42nCC0t';
    final response = await http.post(url,
        headers: {
          'origin': 'http//localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_email': _emailController.text,
            'subject': _subjectController.text,
            'message': _messageController.text,
          }
        }));
    if (response.body == 'OK') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('email sent successfully!'),
          backgroundColor: GREEN,
        ),
      );
      return response.statusCode;
    } else {
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to send email'),
          backgroundColor: RED,
        ),
      );
    }
  }

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
                          sendEmail();
                        }
                      },
                      child: Text('Save'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        _formKey.currentState?.reset();
                      },
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
