import 'package:flutter/material.dart';
import 'package:fuseapp/routers/routing_constants.dart';
import 'package:fuseapp/views/address_book.dart';
import 'package:fuseapp/views/contact_us.dart';
import 'package:fuseapp/views/orders.dart';
import 'package:fuseapp/views/payment.dart';
import 'package:fuseapp/views/personal_informations.dart';
import 'package:fuseapp/views/settings.dart';

class ProfileList {
  final String label;
  final IconData icon;
  final String screen;
  ProfileList(this.label, this.icon, this.screen);
}

List<ProfileList> profileList = [
  ProfileList(
    'Personal Information',
    Icons.person_outline_rounded,
    PersonalInfoViewRoute,
  ),
  ProfileList(
    'Shipping Address',
    Icons.location_on_outlined,
    AddressBookViewRoute,
  ),
  ProfileList(
    'Payment Method',
    Icons.credit_card_outlined,
    PaymentViewRoute,
  ),
  ProfileList(
    'Orders',
    Icons.inventory_2_outlined,
    OrdersViewRoute,
  ),
  ProfileList(
    'Settings',
    Icons.settings,
    SettingsViewRoute,
  ),
  ProfileList(
    'Contact us',
    Icons.phone_enabled_outlined,
    ContactUsViewRoute,
  ),
];
