import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/providers/personal_info.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/translations/locale_keys.g.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import '../services/storage_service.dart';
import '../utils/forms_validations.dart';
import '../view_model/user_vm.dart';

class PersonalInformation extends StatefulWidget {
  final OurUser? argument;
  const PersonalInformation({Key? key, this.argument}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'SA');
  final Storage storage = Storage();

  @override
  Widget build(BuildContext context) {

    print('DATA ${widget.argument?.email}');


    // print('this is the user data ${profileData['test']}');
    PersonalInfo info = PersonalInfo();
    Provider.of<PersonalInfo>(context, listen: false)
        .fetchPersonalInfo(context);
    var obj = Provider.of<PersonalInfo>(context, listen: false);


    return Scaffold(
      appBar: myAppBar(context, title: LocaleKeys.personal_information.tr()),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            profileImage(obj.userData),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          inputText(
                            // initialValue: profileData.name,
                            label: LocaleKeys.name.tr(),
                            keyboardType: TextInputType.name,
                            controller: _nameController,
                            validation: (val) {
                              return validateName(_nameController.text);
                            },
                          ),
                          inputText(
                            // initialValue: profileData.email,
                            label: LocaleKeys.email.tr(),
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validation: (val) {
                              return validateEmail(
                                  _emailController.text.trim());
                            },
                          ),
                          phoneField(),
                          birthField(),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      // updateUser();
                                    }
                                  },
                                  child: Text(LocaleKeys.save.tr()),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    _formKey.currentState?.reset();
                                  },
                                  child: Text(LocaleKeys.cancel.tr()),
                                )
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileImage(OurUser user) {
    return Center(
      child: Column(
        children: [
          (user.avatarURL == null)
              ? ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(50),
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(50),
                        child: Image.asset('assets/img/avatar.png'),
                      ),
                    ),
                  ),
                )
              : ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(50),
                    child: Image.network(
                      user.avatarURL ?? "",
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: Icon(
                  Icons.edit,
                ),
                label: Text(
                  LocaleKeys.edit.tr(),
                  style: h4,
                ),
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['png', 'jpeg', 'jpg', 'PNG'],
                  );
                  if (result != null) {
                    final path = result.files.single.path!;
                    final fileName = result.files.single.name;
                    storage
                        .uploadFile(path, fileName)
                        .then((value) => print('done'));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No file Selected'),
                      ),
                    );
                    return null;
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget phoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.phone_number.tr(),
          style: h3,
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: WHITE,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: BLUISH_GRERY),
          ),
          child: Stack(
            children: [
              phoneNumberField(),
              Positioned(
                left: 90,
                top: 8,
                bottom: 8,
                child: Container(
                  height: 40,
                  width: 1,
                  color: COLOR_PRIMARY,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget phoneNumberField() {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        print(number.phoneNumber);
      },
      validator: (val) {
        return validatePhone(_phoneController.text);
      },
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      initialValue: number,
      textFieldController: _phoneController,
      formatInput: false,
      maxLength: 9,
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: true),
      inputDecoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 15, left: 0),
        border: InputBorder.none,
        hintText: '5xxxxxxx',
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
      ),
      inputBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: BLUISH_GRERY,
        ),
      ),
      onSaved: (PhoneNumber number) {
        print('On Saved: $number');
      },
    );
  }

  Widget birthField() {
    return inputText(
        label: LocaleKeys.date_of_birth.tr(),
        hintText: '22-04-2010',
        keyboardType: TextInputType.datetime,
        readOnly: true,
        controller: _dateController,
        validation: (val) {
          return validateRequiredField(_dateController.text);
        },
        iconButton: IconButton(
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              //DateTime.now() - not to allow to choose before today.
              initialDate: DateTime.now(),
              firstDate: DateTime(1990),
              lastDate: DateTime(2101),
            );

            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('dd-MM-yyyy').format(pickedDate);
              setState(() {
                _dateController.text =
                    formattedDate; //set output date to TextField value.
              });
            }
          },
          icon: Icon(
            Icons.date_range,
            color: COLOR_PRIMARY,
          ),
        ));
  }
}
