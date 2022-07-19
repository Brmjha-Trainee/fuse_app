import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ToggleText with ChangeNotifier {
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  bool _obscureText3 = true;
  bool _obscureText4 = true;
  bool _checkBoxValue = false;
  double _rating = 0;

  bool get obscureText => _obscureText;
  bool get obscureText1 => _obscureText1;
  bool get obscureText2 => _obscureText2;
  bool get obscureText3 => _obscureText3;
  bool get obscureText4 => _obscureText4;
  bool get checkBoxValue => _checkBoxValue;
  double get rating => _rating;

  late TextEditingController dateController;

  void setRating(double rate) {
    _rating = rate;
    notifyListeners();
  }

  void setBirthField(DateTime? pickedDate) {
    //print(pickedDate);
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      print('formattedDate: ' + formattedDate);

      dateController.text = formattedDate;
      notifyListeners();
    }
  }

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

  void togglePasswordStat3() {
    _obscureText3 = !_obscureText3;
    notifyListeners();
  }

  void togglePasswordStat4() {
    _obscureText4 = !_obscureText4;
    notifyListeners();
  }

  void isCheck() {
    _checkBoxValue = !_checkBoxValue;
    notifyListeners();
  }
}
