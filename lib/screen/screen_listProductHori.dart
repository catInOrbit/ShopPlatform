import 'package:ExpShop/listScroll.dart';
import 'package:flutter/material.dart';

class listProductHori extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        cardProduct(),
        cardProduct(),
        cardProduct(),
        cardProduct(),
        cardProduct(),
        cardProduct(),
        cardProduct(),
        cardProduct(),
        cardProduct(),
      ],
    );
  }
}
