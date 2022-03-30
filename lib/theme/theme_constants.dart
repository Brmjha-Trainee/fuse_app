import 'package:flutter/material.dart';

const COLOR_PRIMARY = Color(0xFF9E457E);
const BLACK = Color(0xFF414141);
const WHITE = Color(0xFFFFFFFF);
const DARKER_GREY = Color(0xFF414141);
const IN_BETWEEN_GREY = Color(0xFFC4C4C4);
const LIGHT_GREY = Color(0xFFEAEAEA);
const DARK_BLUISH_GRERY = Color(0xFF8A8A9D);
const BLUISH_GRERY = Color(0xFFDBE3E9);
const GREEN = Color(0xFF47B379);
const RED = Color(0xFFED0006);
const LightRED = Color(0xFFFFE5E5);
const YELLOW = Color(0XFFF1E87F);

//There are 6 headlines (headline1 to headline6)
//and they are the largest text to put on the screen.
// They should be reserved for short and important texts such as:
//      titles
//      numerals

const h2 = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.normal,
  fontSize: 19,
);

const h3 = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.normal,
  fontSize: 18,
);
const h4 = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.normal,
  fontSize: 17,
);
const h5 = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 14,
);

const subtitle = TextStyle(color: DARKER_GREY);
// There are 2 body types (bodyText1 and bodyText2).
// They are smaller than subtitles
// should typically be used for longer texts, such as description.
const bodyText1 = TextStyle(
  color: DARK_BLUISH_GRERY,
  fontWeight: FontWeight.normal,
  height: 1.75,
  fontSize: 17,
);
const bodyText2 = TextStyle(
  color: LIGHT_GREY,
  fontWeight: FontWeight.normal,
  fontSize: 12,
);

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: WHITE,
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(
        color: Colors.grey.withOpacity(0.2),
        width: 1,
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: WHITE,
    titleTextStyle: TextStyle(
      color: COLOR_PRIMARY,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: WHITE,
    selectedIconTheme: IconThemeData(color: COLOR_PRIMARY),
    unselectedIconTheme: IconThemeData(color: LIGHT_GREY),
  ),
  dividerTheme: DividerThemeData(
    thickness: 0.5,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: DARKER_GREY,
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 19,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      side: BorderSide(width: 2, color: COLOR_PRIMARY),
      padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
    ),
  ),
  radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all<Color>(COLOR_PRIMARY)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 19,
      )),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(COLOR_PRIMARY),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: IN_BETWEEN_GREY,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    errorStyle: TextStyle(
      color: RED,
      fontWeight: FontWeight.w500,
      fontSize: 15,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
);
