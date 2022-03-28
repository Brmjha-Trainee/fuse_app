import 'package:flutter/material.dart';
import 'package:fuseapp/screens/home_page.dart';
import 'package:fuseapp/theme/theme_constants.dart';

void main() {
  runApp(const FuseApp());
}

class FuseApp extends StatelessWidget {
  const FuseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
