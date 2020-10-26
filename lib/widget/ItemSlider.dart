import 'package:flutter/material.dart';

class Item1 extends StatelessWidget {
  final String urlBanner;

  const Item1({Key key, this.urlBanner}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(

            // gradient: LinearGradient(
            //   begin: Alignment.bottomLeft,
            //   end: Alignment.topCenter,
            //   colors: [Colors.green, Colors.red],
            // ),
            ),
        child: Image.asset(
          urlBanner,
          fit: BoxFit.cover,
        ));
  }
}
