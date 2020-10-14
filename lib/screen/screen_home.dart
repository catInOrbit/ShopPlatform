import 'package:ExpShop/list_card_notification.dart';
import 'package:ExpShop/list_item.dart';
import 'package:ExpShop/list_product.dart';
import 'package:ExpShop/menuItem.dart';
import 'package:ExpShop/screen/screen_detailProduct.dart';
import 'package:ExpShop/suggest1.dart';
import 'package:ExpShop/suggest2.dart';
import 'package:ExpShop/tab_screen/tab_home_page.dart';
import 'package:ExpShop/tab_screen/tab_like_products.dart';
import 'package:ExpShop/tab_screen/tab_menu.dart';
import 'package:ExpShop/tab_screen/tab_notification.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final tabs = [
    TabHomePage(),
    TabLikeProducts(),
    NotificationPage(),
    TabMenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: ProductDetail(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text(""),
          ),
        ],
      ),
    );
  }
}

Widget appBar(BuildContext context, Color greenColor) {
  return Stack(
    children: <Widget>[
      Container(
        // Background
        child: Center(
          child: Text(
            "Home",
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
        color: greenColor,
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
      ),

      Container(), // Required some widget in between to float AppBar

      Positioned(
        // To take AppBar Size only
        top: 80.0,
        left: 20.0,
        right: 20.0,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 15.0,
              offset: Offset(0.0, 0),
            ),
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: AppBar(
              backgroundColor: Colors.white,
              primary: false,
              title: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey))),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search, color: greenColor),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}

Widget bottomBar(int _currentIndex) {
  return BottomNavigationBar(
    currentIndex: _currentIndex,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text(""),
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.heart_solid),
        title: Text(""),
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.bell_solid),
        title: Text(""),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.menu),
        title: Text(""),
      ),
    ],
  );
}
