import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/providers/show_hide_pass_provider.dart';
import 'package:fuseapp/view_model/auth_services.dart';
import 'package:fuseapp/views/sign_options.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/views/wrapper.dart';
import 'package:provider/provider.dart';

import 'components/bottom_app_bar.dart';

//COMMENTS TODO: 1. when to use pushreplacement instead of put || 2. docmentation
//COMMENTS TODO: Asmaa todo3 tasks done, some issues need to be solved
//COMMENTS TODO: Rawabi didn't see the bottom nav bar, some issues need to be solved
//COMMENTS TODO: Haneen point one is not there "Redirect to homepage, signout, save signup info to db, token
//COMMENTS TODO: Fiazah issue in google sign in and redirect,forget password function, otp" Will postpone this"
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          appId: '1:353265714008:android:817d805da029d846ef1b2d',
          apiKey: 'AIzaSyAMIgI09G28MY9itFTZz81ltPoJCzFySug',
          messagingSenderId: '353265714008',
          projectId: 'fuse-app-f9791'));

  runApp(const FuseApp());
}

class FuseApp extends StatelessWidget {
  const FuseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider(create: (_) => ToggleText())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: Wrapper(),
      ),
    );
  }
}
