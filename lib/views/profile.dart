import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/services/storage_service.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/view_model/user_vm.dart';
import 'package:provider/provider.dart';
import '../providers/personal_info.dart';
import '../view_model/profile_vm.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<PersonalInfo>(context, listen: false)
        .fetchPersonalInfo(context);
    var obj = Provider.of<PersonalInfo>(context, listen: true);
    final Storage storage = Storage();
    return Scaffold(
      appBar: myAppBar2(context, title: 'Profile'),
      body: Column(
        children: [
          profile(context, obj.userData, storage), //Upper profile section
          listTile(context, obj.userData), //profile list tile
        ],
      ),
    );
  }

  Widget listTile(BuildContext context, OurUser user) {
    return Container(
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: profileList.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              ListTile(
                leading: Icon(
                  profileList[i].icon,
                  color: COLOR_PRIMARY,
                ),
                title: Text(
                  profileList[i].label,
                  style: h4,
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  print(user);
                  if (profileList[i].label == 'Personal Information') {
                    Navigator.pushNamed(context, profileList[i].screen,
                        arguments: {
                          'data': user,
                          'test': true,
                        });
                  } else {
                    Navigator.pushNamed(
                      context,
                      profileList[i].screen,
                    );
                  }
                },
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }

  Widget profile(BuildContext context, OurUser user, Storage storage) =>
      Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 8.0, bottom: 20.0),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: COLOR_PRIMARY)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: BLACK,
                    blurRadius: 5.0,
                    offset: Offset(0.0, 0.75),
                  )
                ],
                color: WHITE,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      child: ClipOval(
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
                      onTap: () async {
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            user.name ?? "",
                            style: h2,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            user.phoneNum ?? "",
                            style: subtitle,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
