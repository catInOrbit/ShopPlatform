import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/screen/CreateProductPage.dart';
import 'package:ExpShop/screen/EditProductPage.dart';
import 'package:ExpShop/screen/EditShopInfoPage.dart';
import 'package:ExpShop/screen/FindTheWayPage.dart';
import 'package:ExpShop/screen/LoginPage.dart';
import 'package:ExpShop/screen/PageRecommendV1.dart';
import 'package:ExpShop/screen/PageRecommendV2.dart';
import 'package:ExpShop/screen/ProductDetail.dart';
import 'package:ExpShop/screen/ProfilePage.dart';
import 'package:ExpShop/screen/RegisterPage.dart';
import 'package:ExpShop/screen/ScreenHomeShop.dart';
import 'package:ExpShop/screen/ShopPage.dart';
import 'package:ExpShop/widget/ItemSlider.dart';
import 'package:ExpShop/widget/SaleBanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hexcolor/hexcolor.dart';

import 'screen/ListOrderPage.dart';
import 'screen/RatingPage.dart';
import 'screen/ScreenHome.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/ProductDetail": (context) => ProductDetail(),
        "/PageRecommendV1": (context) => PageRecommendV1(),
        "/PageRecommendV2": (context) => PageRecommendV2(),
        "/ShopPage": (context) => ShopPage(),
        "/RegisterPage": (context) => RegisterPage(),
        "/LoginPage": (context) => LoginPage(),
        "/HomePage": (context) => HomePage(),
        "/ProfilePage": (context) => ProfilePage(),
        "/FindWay": (context) => FindWay(),
        "/HomePageShop": (context) => HomePageShop(),
        "/CreateProductScreen": (context) => CreateProductScreen(),
        "/EditShopInfoPage": (context) => EditShopInfoPage(),
        "/ListOrder": (context) => ListOrder(),
        "/RatingPage": (context) => RatingPage(),
        "/EditProductPage": (context) => EditProductPage(),
      },
      theme: ThemeData(
        primaryColor: GREEN_NEW,
      ),
      title: "ExpShop",
      home: LoginPage(),
    );
  }
}


class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
