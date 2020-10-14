import 'package:ExpShop/list_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  int _currentIndex = 0;
  List cardList = [
    Item1(),
    Item1(),
    Item1(),
  ];
  Color red800 = Colors.green;
  int _currentIndexSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.19999,
            child: Stack(
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
                  color: red800,
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
                            icon: Icon(Icons.search, color: red800),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 20),
          //   child: Text('abcss'),
          // ),
          CarouselSlider(
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
          ),
          CarouselSlider(
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
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
