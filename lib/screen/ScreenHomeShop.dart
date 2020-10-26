import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/screen/EditShopInfoPage.dart';
import 'package:ExpShop/tab_screen/TabHomePageShop.dart';
import 'package:ExpShop/tab_screen/TabMenuShop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageShop extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageShop> {
  int _currentIndex = 0;
  final tabs = [
    TabHomeShopPage(),
    TabMenuSHopPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: FlatButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, EditShopInfoPage().urlEditShopInfoPage);
            },
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/banner2.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Vĩnh Phúc Shop',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          actions: [
            () {
              if (_currentIndex == 0) {
                return IconButton(
                    icon: Icon(
                      FontAwesomeIcons.plus,
                      color: WHITE,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/CreateProductScreen');
                    });
              } else {
                return Text('');
              }
            }(),
          ],
          bottom: () {
            if (_currentIndex == 0) {
              return PreferredSize(
                preferredSize: Size.square(50),
                child: Container(
                  padding: EdgeInsets.only(bottom: 5),
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: GREENWHITE,
                        filled: true,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Tìm sản phẩm ?',
                        contentPadding: EdgeInsets.all(15)),
                  ),
                ),
              );
            } else {
              return null;
            }
          }()),
      body: tabs[_currentIndex],
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
            icon: Icon(Icons.home, size: 28.0),
            title: Text("Trang chủ"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, size: 28.0),
            title: Text("Khác"),
          ),
        ],
      ),
    );
  }

  Future buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return Container(
            decoration: BoxDecoration(),
            height: MediaQuery.of(context).size.height * 0.90,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text(
                    'Chọn khu vực của bạn',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Container(
                    color: GREENWHITE,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Tìm vị trí',
                        prefixIcon: Icon(FontAwesomeIcons.mapMarkerAlt),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Container(
                    padding: EdgeInsets.only(top: 15, bottom: 25),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1))),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.mapMarkedAlt,
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'CHỌN TRÊN BẢN ĐỒ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.mapMarkerAlt),
                    title: Text('Vị trí hiện tại của bản'),
                    subtitle: Text('quốc lộ ABC'),
                  ),
                )
              ],
            ),
          );
        });
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
