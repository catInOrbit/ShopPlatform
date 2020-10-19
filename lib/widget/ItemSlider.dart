import 'package:flutter/material.dart';

class Item1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topCenter,
            colors: [Colors.green, Colors.red],
          ),
        ),
        child: Image.network(
          'https://image.freepik.com/free-vector/green-sale-banner_1017-7937.jpg',
          fit: BoxFit.cover,
        ));
  }
}
