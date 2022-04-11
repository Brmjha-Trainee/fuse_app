import 'package:flutter/material.dart';

class ToggleText with ChangeNotifier {
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  bool _checkBoxValue = false;

  bool get obscureText => _obscureText;
  bool get obscureText1 => _obscureText1;
  bool get obscureText2 => _obscureText2;
  bool get checkBoxValue => _checkBoxValue;

  void togglePasswordStat() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void togglePasswordStat1() {
    _obscureText1 = !_obscureText1;
    notifyListeners();
  }

  void togglePasswordStat2() {
    _obscureText2 = !_obscureText2;
    notifyListeners();
  }

  void isCheck() {
    _checkBoxValue = !_checkBoxValue;
    notifyListeners();
  }
}
