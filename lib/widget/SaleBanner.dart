import 'package:ExpShop/fake_data/Colors.dart';
import 'package:flutter/material.dart';

class SaleBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 350,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SaleBannerChild(),
          SaleBannerChild(),
        ],
      ),
    ));
  }
}

class SaleBannerChild extends StatelessWidget {
  const SaleBannerChild({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ]),
        width: 150,
        height: 350,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: GREENKITKAT,
              ),
              height: 250,
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/kitkat.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              width: 150,
              height: 100,
              color: WHITE,
              child: Column(
                children: [
                  Text(
                    'KitKat mua 2 tang 1',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('QUAN1, ABCS'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
