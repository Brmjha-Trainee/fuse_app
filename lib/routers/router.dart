import 'package:flutter/material.dart';
import 'package:fuseapp/routers/routing_constants.dart';
import 'package:fuseapp/routers/undefined_view_router.dart';
import 'package:fuseapp/views/add_book.dart';
import 'package:fuseapp/views/address_book.dart';
import 'package:fuseapp/views/contact_us.dart';
import 'package:fuseapp/views/edit_book.dart';
import 'package:fuseapp/views/forget_password2.dart';
import 'package:fuseapp/views/home.dart';
import 'package:fuseapp/views/languages.dart';
import 'package:fuseapp/views/login.dart';
import 'package:fuseapp/views/notifications.dart';
import 'package:fuseapp/views/orders.dart';
import 'package:fuseapp/views/payment.dart';
import 'package:fuseapp/views/personal_informations.dart';
import 'package:fuseapp/views/profile.dart';
import 'package:fuseapp/views/settings.dart';
import 'package:fuseapp/views/sign_options.dart';
import 'package:fuseapp/views/sign_up1.dart';
import 'package:fuseapp/views/sign_up2.dart';
import 'package:fuseapp/views/sign_up3.dart';
import 'package:fuseapp/views/wrapper.dart';
import '../views/forget_password1.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

PhoneNumber number = PhoneNumber();
Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case WrapperRoute:
      return MaterialPageRoute(builder: (context) => Wrapper());
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    case SignOptionViewRoute:
      return MaterialPageRoute(builder: (context) => SignOption());
    case LoginViewRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case SignUp1ViewRoute:
      return MaterialPageRoute(builder: (context) => SignUpPage());
    case SignUp2ViewRoute:
      return MaterialPageRoute(builder: (context) => CreateAccount(number));
    case SignUp3ViewRoute:
      return MaterialPageRoute(builder: (context) => Signup3());
    case ForgetPass1ViewRoute:
      return MaterialPageRoute(builder: (context) => ResetPasswordPage());
    case ForgetPass2ViewRoute:
      return MaterialPageRoute(builder: (context) => ResetPasswordPage2());
    case ProfileViewRoute:
      return MaterialPageRoute(builder: (context) => Profile());
    case AddBookViewRoute:
      return MaterialPageRoute(builder: (context) => AddAdressBook());
    case AddressBookViewRoute:
      return MaterialPageRoute(builder: (context) => AddressBook());
    case EditBookViewRoute:
      return MaterialPageRoute(builder: (context) => EditAdressBook());
    case PaymentViewRoute:
      return MaterialPageRoute(builder: (context) => Payment());
    case OrdersViewRoute:
      return MaterialPageRoute(builder: (context) => Orders());
    case PersonalInfoViewRoute:
      return MaterialPageRoute(builder: (context) => PersonalInformation());
    case SettingsViewRoute:
      return MaterialPageRoute(builder: (context) => SettingsScreen());
    case Notification1ViewRoute:
      return MaterialPageRoute(builder: (context) => Notification1());
    case LanguageViewRoute:
      return MaterialPageRoute(builder: (context) => LanguagesScreen());
    case ContactUsViewRoute:
      return MaterialPageRoute(builder: (context) => ContactUs());
    default:
      return MaterialPageRoute(
          builder: (context) => UndefinedView(name: settings.name));
  }
}
