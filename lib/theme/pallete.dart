//palette.dart
import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xFF9E457E, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: Color.fromRGBO(136, 14, 79, .1), //10%
      100: Color.fromRGBO(136, 14, 79, .2), //20%
      200: Color.fromRGBO(136, 14, 79, .3), //30%
      300: Color.fromRGBO(136, 14, 79, .4), //40%
      400: Color.fromRGBO(136, 14, 79, .5), //50%
      500: Color.fromRGBO(136, 14, 79, .6), //60%
      600: Color.fromRGBO(136, 14, 79, .7), //70%
      700: Color.fromRGBO(136, 14, 79, .8), //80%
      800: Color.fromRGBO(136, 14, 79, .9), //90%
      900: Color.fromRGBO(136, 14, 79, 1), //100%
    },
  );
} // you can define define int 500 as the default shade and add your lighter tints above and darker tints below.
