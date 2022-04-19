import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';

import '../view_model/profile_vm.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: 'Profile'),
      body: Column(
        children: [
          profile(context), //Upper profile section
          listTile(context), //profile list tile
        ],
      ),
    );
  }

  Widget listTile(BuildContext context) => Container(
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
                    Navigator.pushReplacementNamed(
                        context, profileList[i].screen);
                  },
                ),
                Divider(),
              ],
            );
          },
        ),
      );
  Widget profile(BuildContext context) => Container(
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
                    Image.asset(
                      'assets/img/avatar.png',
                      width: 80.0,
                      height: 80.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Omar Ahmed",
                            style: h2,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "+966 510510510",
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
