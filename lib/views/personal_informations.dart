import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/translations/locale_keys.g.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import '../providers/personal_info.dart';
import '../providers/toggle_text.dart';
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
  PhoneNumber number = PhoneNumber(isoCode: 'SA');
  final Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController =
        TextEditingController(text: widget.argument?.name);
    final TextEditingController _emailController =
        TextEditingController(text: widget.argument?.email);
    TextEditingController _phoneController =
        TextEditingController(text: widget.argument?.phoneNum);

    var obj = Provider.of<ToggleText>(context, listen: false);
    var info = Provider.of<PersonalInfo>(context, listen: false);
    obj.dateController = TextEditingController(text: widget.argument?.birth);

    Future<void> updateUser() {
      String uid = info.currentUserId();
      CollectionReference users =
          FirebaseFirestore.instance.collection('Users');
      return users
          .doc(uid)
          .update({
            'name': _nameController.text,
            'email': _emailController.text,
            'phone_number': _phoneController.text,
            'date': obj.dateController.text,
          })
          .then((value) => print(uid))
          .catchError(
              (error) => print("Failed to update Personal information $error"));
    }

    return Scaffold(
      appBar: myAppBar(context, title: LocaleKeys.personal_information.tr()),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            profileImage(),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          nameField(_nameController),
                          emailField(_emailController),
                          phoneField(_phoneController),
                          inputText(label: 'Gender'),
                          Consumer<ToggleText>(builder: (_, val, __) {
                            return birthField(val.dateController, context);
                          }),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      updateUser();
                                      Navigator.pop(context);
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
                                    Navigator.pop(context);
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

  Widget profileImage() {
    return Center(
      child: Column(
        children: [
          (widget.argument?.avatarURL == null)
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
                    child: CachedNetworkImage(
                      imageUrl: widget.argument?.avatarURL ?? '',
                      fit: BoxFit.contain,
                      placeholder: (context, url) =>
                          new CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
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

  Widget birthField(
      TextEditingController dateController, BuildContext context) {
    return inputText(
        label: LocaleKeys.date_of_birth.tr(),
        keyboardType: TextInputType.datetime,
        readOnly: true,
        controller: dateController,
        validation: (val) {
          return validateRequiredField(dateController.text);
        },
        onSaved: (val) {},
        onChanged: (val) {},
        iconButton: IconButton(
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime
                  .now(), //DateTime.now() - not to allow to choose before today.
              firstDate: DateTime(1990),
              lastDate: DateTime(2101),
            );
            Provider.of<ToggleText>(context, listen: false)
                .setBirthField(pickedDate);
          },
          icon: Icon(
            Icons.date_range,
            color: COLOR_PRIMARY,
          ),
        ));
  }

  Widget nameField(TextEditingController _nameController) {
    return inputText(
      label: LocaleKeys.name.tr(),
      keyboardType: TextInputType.name,
      controller: _nameController,
      validation: (val) {
        return validateName(_nameController.text);
      },
    );
  }

  Widget emailField(TextEditingController _emailController) {
    return inputText(
      label: LocaleKeys.email.tr(),
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validation: (val) {
        return validateEmail(_emailController.text.trim());
      },
    );
  }

  Column phoneField(TextEditingController _phoneController) {
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
              phoneInput(_phoneController),
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

  InternationalPhoneNumberInput phoneInput(
      TextEditingController _phoneController) {
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
}
