import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/screen/PageRecommendV1.dart';
import 'package:ExpShop/screen/PageRecommendV2.dart';
import 'package:ExpShop/screen/ProductDetail.dart';
import 'package:ExpShop/widget/ItemSlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hexcolor/hexcolor.dart';

import 'screen/ScreenHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        "/ProductDetail": (context) => ProductDetail(),
        "/PageRecommendV1": (context) => PageRecommendV1(),
        "/PageRecommendV2": (context) => PageRecommendV2(),
      },
      theme: ThemeData(
        primaryColor: GREEN,
      ),
      title: "ExpShop",
      home: HomePage(),
    );
  }
}
