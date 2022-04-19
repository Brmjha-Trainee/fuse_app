import 'package:flutter/material.dart';
import 'package:fuseapp/routers/routing_constants.dart';
import 'package:fuseapp/view_model/auth_services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, ProfileViewRoute);
                  },
                  child: Text('Profile')),
              OutlinedButton(
                  onPressed: () async {
                    await authService.signOut();
                  },
                  child: Text('log out')),
            ],
          )
        ],
      )),
    );
  }
}
