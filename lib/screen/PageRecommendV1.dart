import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/widget/ListProduct.dart';
import 'package:ExpShop/widget/ListScrollHori.dart';
import 'package:flutter/material.dart';

class PageRecommendV1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: GREEN,
        child: ListView(
          children: [
            ListHoriScrollPageRecommendV1(),
            Container(
              decoration: BoxDecoration(
                color: GREENWHITE,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  CardProductHori(),
                  CardProductHori(),
                  CardProductHori(),
                  CardProductHori(),
                  CardProductHori(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
