import 'package:ExpShop/fake_data/Colors.dart';
import 'package:flutter/material.dart';

class CategoryFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardCategory(),
              CardCategory(),
              CardCategory(),
              CardCategory(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardCategory(),
              CardCategory(),
              CardCategory(),
              CardCategory(),
            ],
          ),
        ],
      ),
    );
  }
}

class CardCategory extends StatelessWidget {
  const CardCategory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/icons/milk.png'),
            ),
            Text('bơ sữa'),
          ],
        ),
      ),
    );
  }
}
