import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/widget/CardMostPopularV3.dart';
import 'package:ExpShop/widget/CategoryFood.dart';
import 'package:ExpShop/widget/ListScrollHori.dart';
import 'package:ExpShop/widget/ItemSlider.dart';
import 'package:ExpShop/widget/ListProduct.dart';

import 'package:ExpShop/widget/CardMostPopularV1.dart';
import 'package:ExpShop/widget/CardMostPopularV2.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabHomeShopPage extends StatelessWidget {
  List cardList = [
    Item1(urlBanner: "assets/images/Banner1.jpg"),
    Item1(urlBanner: "assets/images/Banner3.jpg"),
    Item1(urlBanner: "assets/images/Banner4.jpg"),
  ];
  Color greenColor = Colors.green;
  int _currentIndexSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GREENWHITE,
      child: ListView(
        children: [
          CardProductHori(productItem: listProduct[2]),
          CardProductHori(productItem: listProduct[3]),
          CardProductHori(productItem: listProduct[5]),
          CardProductHori(productItem: listProduct[7]),
          CardProductHori(productItem: listProduct[9]),
        ],
      ),
    );
  }
}
