import 'package:ExpShop/list_card_notification.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          cardProduct,
        ],
      ),
    );
  }
}
