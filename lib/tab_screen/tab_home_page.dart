import 'package:ExpShop/listScroll.dart';
import 'package:ExpShop/list_item.dart';
import 'package:ExpShop/list_product.dart';

import 'package:ExpShop/suggest1.dart';
import 'package:ExpShop/suggest2.dart';
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
          listScrollHori(),
          containerItems(context),
          suggestCardFull(context),
          listHomeProducts(context),
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
