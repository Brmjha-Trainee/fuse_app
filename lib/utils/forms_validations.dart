import 'package:form_field_validator/form_field_validator.dart';

//////////////////////////validations USED FOR FORMS///////////////////////////
String? validateRequiredField(String value) {
  if (value.isEmpty) {
    return 'This field is required';
  }
  return null;
}

String? validateName(String value) {
  if (value.isEmpty) {
    return 'This field is required';
  } else if (value.length < 7) {
    return 'Full name must be at least 7 characters.';
  }
  return null;
}

String? validateTextArea(String value) {
  if (value.isEmpty) {
    return 'This field is required';
  } else if (value.length < 7) {
    return 'Message must be at least 7 characters.';
  }
  return null;
}

String? validateSubject(String value) {
  if (value.isEmpty) {
    return 'This field is required';
  } else if (value.length < 5) {
    return 'Subject be at least 5 characters.';
  }
  return null;
}

String? validatePass(String value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value.isEmpty) {
    return 'This field is required.';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Enter valid password ex Ab12345&';
    } else {
      return null;
    }
  }
}

final confirmPassValidation = MatchValidator(
    errorText: 'The password and its confirmation does not match');
String? validatePhone(dynamic value) {
  RegExp regex = RegExp(r'^(?:\+?0*?966)?0?(5[0-9]{8})$');
  if (value.isEmpty) {
    return 'This field is required.';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Please enter valid phone number';
    } else {
      return null;
    }
  }
}

String? validateEmail(dynamic value) {
  RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (value.isEmpty) {
    return 'This field is required.';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Please enter your email address in format:\nyourname@example.com';
    } else {
      return null;
    }
  }
}

enum CardType {
  MasterCard,
  Visa,
  Verve,
  Others, // Any other card issuer
  Invalid // We'll use this when the card is invalid
}

CardType getCardTypeFrmNumber(String input) {
  CardType cardType;
  if (input.startsWith(new RegExp(
      r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
    cardType = CardType.MasterCard;
  } else if (input.startsWith(new RegExp(r'[4]'))) {
    cardType = CardType.Visa;
  } else if (input.startsWith(new RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
    cardType = CardType.Verve;
  } else if (input.length <= 8) {
    cardType = CardType.Others;
  } else {
    cardType = CardType.Invalid;
  }
  return cardType;
}

String? validateDate(String value) {
  if (value.isEmpty) {
    return "This field is required";
  }

  int year;
  int month;
  // The value contains a forward slash if the month and year has been
  // entered.
  if (value.contains(new RegExp(r'(\/)'))) {
    var split = value.split(new RegExp(r'(\/)'));
    // The value before the slash is the month while the value to right of
    // it is the year.
    month = int.parse(split[0]);
    year = int.parse(split[1]);
  } else {
    // Only the month was entered
    month = int.parse(value.substring(0, (value.length)));
    year = -1; // Lets use an invalid year intentionally
  }

  if ((month < 1) || (month > 12)) {
    // A valid month is between 1 (January) and 12 (December)
    return 'Expiry month is invalid';
  }

  var fourDigitsYear = convertYearTo4Digits(year);
  if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
    // We are assuming a valid year should be between 1 and 2099.
    // Note that, it's valid doesn't mean that it has not expired.
    return 'Expiry year is invalid';
  }

  if (!hasDateExpired(month, year)) {
    return "Card has expired";
  }
  return null;
}

/// Convert the two-digit year to four-digit year if necessary
int convertYearTo4Digits(int year) {
  if (year < 100 && year >= 0) {
    var now = DateTime.now();
    String currentYear = now.year.toString();
    String prefix = currentYear.substring(0, currentYear.length - 2);
    year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
  }
  return year;
}

bool hasDateExpired(int month, int year) {
  return !(year == null) && isNotExpired(year, month);
}

bool isNotExpired(int year, int month) {
  // It has not expired if both the year and date has not passed
  return !hasYearPassed(year) && !hasMonthPassed(year, month);
}

bool hasMonthPassed(int year, int month) {
  var now = DateTime.now();
  // The month has passed if:
  // 1. The year is in the past. In that case, we just assume that the month
  // has passed
  // 2. Card's month (plus another month) is less than current month.
  return hasYearPassed(year) ||
      convertYearTo4Digits(year) == now.year && (month < now.month + 1);
}

bool hasYearPassed(int year) {
  int fourDigitsYear = convertYearTo4Digits(year);
  var now = DateTime.now();
  // The year has passed if the year we are currently, is greater than card's
  // year
  return fourDigitsYear < now.year;
}

String? validateCVV(String value) {
  if (value.isEmpty) {
    return "This field is required";
  }

  if (value.length < 3 || value.length > 4) {
    return "CVV is invalid";
  }
  return null;
}
