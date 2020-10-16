import 'package:ExpShop/widget/CardNotification.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          CardNotification(),
          CardNotification(),
          CardNotification(),
          CardNotification(),
          CardNotification(),
        ],
      ),
    );
  }
}
