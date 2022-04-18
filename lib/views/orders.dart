import 'package:flutter/material.dart';

import '../theme/theme_constants.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: 'Orders'),
      body: Center(
        child: Text('tgbe'),
      ),
    );
  }
}
