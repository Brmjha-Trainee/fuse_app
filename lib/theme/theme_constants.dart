import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/theme/pallete.dart';

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
const h1 = TextStyle(
  color: COLOR_PRIMARY,
  fontWeight: FontWeight.w500,
  fontSize: 28,
);
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
const h6 = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.normal,
  fontSize: 13,
  decoration: TextDecoration.none,
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
const darkBtnText = TextStyle(
  color: WHITE,
  fontWeight: FontWeight.w600,
  fontSize: 19,
);
const lightBtnText = TextStyle(
  color: DARKER_GREY,
  fontWeight: FontWeight.w600,
  fontSize: 19,
);
TextSpan linkText({label, required BuildContext context, pageName, fontSize}) {
  return TextSpan(
    text: label,
    style: TextStyle(
      decoration: TextDecoration.underline,
      fontSize: fontSize,
    ),
    recognizer: TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pageName,
          ),
        );
      },
  );
}

RichText richText({label_1, label_2, required BuildContext context, pageName}) {
  return RichText(
    text: TextSpan(
        text: label_1,
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontSize: 18,
        ),
        children: <TextSpan>[
          TextSpan(
            text: label_2,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: COLOR_PRIMARY,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => pageName,
                  ),
                );
              },
          )
        ]),
  );
}

// we will be creating a widget for text field
Widget inputText({
  label,
  obscureText = false,
  hintText,
  IconButton? iconButton,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: h3,
      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
            suffixIcon: iconButton,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: LIGHT_GREY,
              ),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: LIGHT_GREY,
            ))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}

MaterialButton darkBtn({label, required BuildContext context, pageName}) {
  return MaterialButton(
    color: COLOR_PRIMARY,
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => pageName,
        ),
      );
    },
    minWidth: double.infinity,
    height: 60,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    child: Text(
      label,
      style: darkBtnText,
    ),
  );
}

MaterialButton lightBtn({label, required BuildContext context, pageName}) {
  return MaterialButton(
    color: WHITE,
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => pageName,
        ),
      );
    },
    minWidth: double.infinity,
    height: 60,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: BorderSide(color: COLOR_PRIMARY)),
    child: Text(
      label,
      style: lightBtnText,
    ),
  );
}

ThemeData appTheme = ThemeData(
  primarySwatch: Palette.kToDark,
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
