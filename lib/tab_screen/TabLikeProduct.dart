import 'package:ExpShop/widget/ListProduct.dart';
import 'package:flutter/material.dart';

class TabLikeProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 197 / 300,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        children: <Widget>[
          CardProduct(),
          CardProduct(),
          CardProduct(),
          CardProduct(),
          CardProduct(),
          CardProduct(),
          CardProduct(),
          CardProduct(),
        ],
      ),
    );
  }
}
