import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/theme/pallete.dart';

import '../translations/locale_keys.g.dart';
import '../utils/forms_validations.dart';

const COLOR_PRIMARY = Color(0xFF9E457E);
const BLACK = Color(0xFF414141);
const WHITE = Color(0xFFFFFFFF);
const DARKER_GREY = Color(0xFF414141);
const DARK_GREY = Color(0xFF828282);
const GREY = Color(0xFFBDBDBD);
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
const h7 = TextStyle(
  color: DARK_GREY,
  fontWeight: FontWeight.normal,
  fontSize: 14,
);
const subtitle = TextStyle(
  color: GREY,
  fontWeight: FontWeight.normal,
  fontSize: 16,
);
const subtitle2 = TextStyle(
  color: BLACK,
  fontWeight: FontWeight.normal,
  fontSize: 24,
);
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
const appBarText = TextStyle(
  color: COLOR_PRIMARY,
  fontSize: 19,
  fontWeight: FontWeight.w600,
);
const nonUnderlineText = TextStyle(
  decoration: TextDecoration.none,
  color: COLOR_PRIMARY,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
const underlineText = TextStyle(
  decoration: TextDecoration.underline,
  fontSize: 18,
  color: DARKER_GREY,
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
        Navigator.pushReplacementNamed(context, pageName);
      },
  );
}

RichText richText({label_1, label_2, required BuildContext context, pageName}) {
  return RichText(
    text: TextSpan(text: label_1, style: underlineText, children: <TextSpan>[
      TextSpan(
        text: label_2,
        style: nonUnderlineText,
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.pushReplacementNamed(context, pageName);
          },
      )
    ]),
  );
}

// we will be creating a widget for text field
Widget inputText(
    {label,
    obscureText = false,
    hintText,
    IconButton? iconButton,
    validation,
    controller,
    keyboardType,
    onChanged,
    readOnly = false,
    initialValue,
    onSaved}) {
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
        initialValue: initialValue,
        readOnly: readOnly,
        controller: controller,
        validator: validation,
        onChanged: onChanged,
        onSaved: onSaved,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffixIcon: iconButton,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: BLUISH_GRERY,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}

// message field
Widget textAreaInput({
  label,
  hintText,
  validation,
  controller,
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
        maxLines: 8,
        maxLength: 100,
        controller: controller,
        validator: validation,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: BLUISH_GRERY,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}

Widget languageDropDowninput({
  required BuildContext context,
  selectedValue,
  List<String>? languageItems,
  formKey,
  void Function()? onPressed,
}) {
  return Form(
    key: formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.language.tr(),
          style: h3,
        ),
        SizedBox(height: 5),
        DropdownButtonFormField2(
          decoration: InputDecoration(
            //Add isDense true and zero Padding.
            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: BLUISH_GRERY,
              ),
            ),
            //Add more decoration as you want here
            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
          ),
          isExpanded: true,
          value: selectedValue,
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.black45,
          ),
          iconSize: 30,
          buttonHeight: 60,
          buttonPadding: const EdgeInsets.only(left: 20, right: 10),
          items: languageItems!
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: h4),
                  ))
              .toList(),
          validator: (value) {
            validateDropDown(value);
            return null;
          },
          onChanged: (value) async {
            selectedValue = value;
            if (value == 'English') {
              await context.setLocale(Locale('en'));
              print(selectedValue);
            } else {
              await context.setLocale(Locale('ar'));
              print(selectedValue);
            }
          },
          onSaved: (value) {
            selectedValue = value.toString();
          },
        ),
        const SizedBox(height: 30),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     ElevatedButton(
        //       onPressed: () async {
        //         if (selectedValue == 'English') {
        //           await context.setLocale(Locale('en'));
        //           print(selectedValue);
        //         } else {
        //           await context.setLocale(Locale('ar'));
        //           print(selectedValue);
        //         }
        //       },
        //       child: Text(LocaleKeys.save.tr()),
        //     ),
        //     SizedBox(
        //       width: 5,
        //     ),
        //     OutlinedButton(
        //       onPressed: () {
        //         formKey.currentState?.reset();
        //         Navigator.pop(context);
        //       },
        //       child: Text(LocaleKeys.cancel.tr()),
        //     )
        //   ],
        // ),
      ],
    ),
  );
}

MaterialButton darkBtn({label, Function()? onPressed, bool isIcon = false}) {
  return MaterialButton(
      color: COLOR_PRIMARY,
      onPressed: onPressed,
      minWidth: double.infinity,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isIcon) Icon(Icons.add_circle_outline, color: Colors.white),
          SizedBox(
            width: 5,
          ),
          Text(
            label,
            style: darkBtnText,
          ),
        ],
      ));
}

MaterialButton lightBtn({
  label,
  Function()? onPressed,
  img,
}) {
  return MaterialButton(
    color: WHITE,
    onPressed: onPressed,
    minWidth: double.infinity,
    height: 60,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
      side: BorderSide(color: COLOR_PRIMARY),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          img,
          height: 20,
          width: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          label,
          style: lightBtnText,
        ),
      ],
    ),
  );
}

// title and back button only
AppBar myAppBar(
  context, {
  String? title,
}) {
  return AppBar(
    title: Text(
      title!,
      style: appBarText,
    ),
    centerTitle: true,
    leading: IconButton(
        icon: Icon(Icons.arrow_back_rounded),
        onPressed: () {
          Navigator.pop(context);
        }),
  );
}

// title only
AppBar myAppBar2(
  context, {
  String? title,
}) {
  return AppBar(
    title: Text(
      title!,
      style: appBarText,
    ),
    centerTitle: true,
  );
}

AppBar myAppBar3(
  context,
) {
  return AppBar(
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
          icon: Icon(
            Icons.close_rounded,
            color: IN_BETWEEN_GREY,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    ],
    centerTitle: true,
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
    elevation: 0,
    backgroundColor: WHITE,
    titleTextStyle: TextStyle(
      color: COLOR_PRIMARY,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
    actionsIconTheme: IconThemeData(color: BLACK),
    iconTheme: IconThemeData(color: BLACK),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: WHITE,
    selectedIconTheme: IconThemeData(color: COLOR_PRIMARY),
    unselectedIconTheme: IconThemeData(color: COLOR_PRIMARY),
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
    fillColor: MaterialStateProperty.all<Color>(COLOR_PRIMARY),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 19,
      ),
      padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      primary: COLOR_PRIMARY,
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
