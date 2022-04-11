//UI Asmaa, BE haneen
import 'package:flutter/material.dart';
import 'package:fuseapp/utils/forms_validations.dart';
import 'package:fuseapp/view_model/auth_services.dart';
import 'package:fuseapp/views/sign_up1.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//Fixme asmaa can't write to textfield error is clear just focus :)
class _LoginScreenState extends State<LoginScreen> {
  //FixMe ASMAA use provider to build only the textfield not the whole screen

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
    final TextEditingController passController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
        body: SingleChildScrollView(
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
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      inputText(
                        label: 'Email',
                        hintText: 'example@gmail.com',
                        controller: emailController,
                        validation: (val) {
                          return validateEmail(emailController.text);
                        },
                      ),
                      inputText(
                        label: 'Password',
                        hintText: '*******',
                        obscureText: _obscureText,
                        controller: passController,
                        validation: (value) {
                          return validatePass(passController.text);
                        },
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
                          onPressed: () {
                            //todo rawabi redirect to forget password screen
                          },
                          child: Text(
                            'Forgot Password?',
                            style: h3.copyWith(fontSize: 14),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      darkBtn(
                          label: 'Login',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              authService.signInWithEmailAndPassword(
                                  emailController.text,
                                  passController.text,
                                  context);
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
            richText(
              context: this.context,
              label_1: 'New Member',
              label_2: ' create new account',
              pageName: SignUpPage(),
            )
          ],
        ),
      ),
    ));
  }
}
