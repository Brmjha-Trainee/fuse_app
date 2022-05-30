import 'package:flutter/material.dart';
import 'package:fuseapp/routers/routing_constants.dart';
import 'package:fuseapp/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileList {
  final String label;
  final IconData icon;
  final String screen;
  ProfileList(this.label, this.icon, this.screen);
}

List<ProfileList> profileList = [
  ProfileList(
    LocaleKeys.personal_information.tr(),
    Icons.person_outline_rounded,
    PersonalInfoViewRoute,
  ),
  ProfileList(
    LocaleKeys.shipping_address.tr(),
    Icons.location_on_outlined,
    AddressBookViewRoute,
  ),
  ProfileList(
    LocaleKeys.payment_method.tr(),
    Icons.credit_card_outlined,
    PaymentViewRoute,
  ),
  ProfileList(
    LocaleKeys.orders.tr(),
    Icons.inventory_2_outlined,
    OrdersViewRoute,
  ),
  ProfileList(
    LocaleKeys.settings.tr(),
    Icons.settings,
    SettingsViewRoute,
  ),
  ProfileList(
    LocaleKeys.contact_us.tr(),
    Icons.phone_enabled_outlined,
    ContactUsViewRoute,
  ),
];
