import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/view_model/auth_services.dart';
import 'package:fuseapp/views/sign_options.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:provider/provider.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const SignOption(),
      ),
    );
  }
}
