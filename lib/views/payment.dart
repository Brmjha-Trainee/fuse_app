import 'package:flutter/material.dart';

import '../theme/theme_constants.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: 'Payment Method'),
      body: Center(
        child: Text('tgbe'),
      ),
    );
  }
}
