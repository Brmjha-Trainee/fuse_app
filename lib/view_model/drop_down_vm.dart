class DropdownModel {
  static String? selectedValue = 'English';
  static String? getSelectedValue() {
    return selectedValue;
  }

  static void setSelectedValue(String? value) {
    selectedValue = value;
    return null;
  }
}
