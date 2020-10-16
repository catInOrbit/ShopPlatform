import 'package:ExpShop/widget/ListScrollHori.dart';
import 'package:ExpShop/widget/ItemSlider.dart';
import 'package:ExpShop/widget/ListProduct.dart';

import 'package:ExpShop/widget/CardMostPopularV1.dart';
import 'package:ExpShop/widget/CardMostPopularV2.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabHomePage extends StatelessWidget {
  List cardList = [
    Item1(),
    Item1(),
    Item1(),
  ];
  Color greenColor = Colors.green;
  int _currentIndexSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: ListView(
        children: [
          sliderFood(cardList, _currentIndexSlider),
          ListHoriScroll(),
          CardMostPopular(),
          CardMostPopularV2(),
          ListProductHomePage2Column(),
        ],
      ),
    );
  }
}

Widget sliderFood(List cardList, int _currentIndexSlider) {
  return CarouselSlider(
    options: CarouselOptions(
      height: 200.0,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      pauseAutoPlayOnTouch: true,
      aspectRatio: 2.0,
      onPageChanged: (index, caroChangeReson) {
        _currentIndexSlider = index;
      },
    ),
    items: cardList.map(
      (card) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.blueAccent,
                child: card,
              ),
            );
          },
        );
      },
    ).toList(),
  );
}
