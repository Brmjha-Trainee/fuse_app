import 'package:flutter/material.dart';
import 'package:fuseapp/components/bottom_app_bar.dart';
import 'package:fuseapp/services/auth_services.dart';
import 'package:fuseapp/view_model/user_vm.dart';
import 'package:fuseapp/views/sign_options.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<OurUser?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<OurUser?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final OurUser? user = snapshot.data;
          return user == null ? SignOption() : Root();
        } else {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
