import 'package:ExpShop/bloc/products_retreive_bloc.dart';
import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/screen/ListOrderPage.dart';
import 'package:ExpShop/screen/PageRecommendV1.dart';
import 'package:ExpShop/screen/PageRecommendV2.dart';
import 'package:ExpShop/screen/ProductDetail.dart';
import 'package:ExpShop/screen/ProfilePage.dart';
import 'package:ExpShop/screen/RatingPage.dart';
import 'package:ExpShop/screen/ShopPage.dart';
import 'package:ExpShop/shop/check_out_page.dart';
import 'package:ExpShop/tab_screen/TabHomePage.dart';
import 'package:ExpShop/tab_screen/TabLikeProduct.dart';
import 'package:ExpShop/tab_screen/TabMenu.dart';
import 'package:ExpShop/tab_screen/TabNotification.dart';
import 'package:ExpShop/tab_screen/TabQRCodePage.dart';
import 'package:ExpShop/widget/CategoryFood.dart';
import 'package:ExpShop/widget/StarRating.dart';
import 'package:ExpShop/widget/shop_bottomSheet.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    productsListBloc.getAllShops();
    super.initState();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  int _currentIndex = 0;
  final tabs = [
    TabHomePage(),
    CheckOutPage(),
    QRCodePage(),
    NotificationPage(),
    TabMenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    String searchValue;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: () {
            if (_currentIndex == 0) {
              return FlatButton(
                onPressed: () {
                  buildShowModalBottomSheet(context);
                },
                child: Row(
                  children: [
                    Text(
                      '50 Đường số 6',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              );
            } else if (_currentIndex == 1) {
              return Text('Giỏ của bạn',style: TextStyle(color: Colors.white),);
            } else if (_currentIndex == 2) {
              return Text('Thanh toán');
            } else if (_currentIndex == 3) {
              return Text('Thông Báo');
            } else {
              return FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/ProfilePage');
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/banner2.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Nguyễn Văn A',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              );
            }
          }(),
          actions: [
            () {
              if (_currentIndex == 2) {
                return Row(
                  children: [
                    Text(
                      'Lịch sử',
                      style: TextStyle(fontSize: 17),
                    ),
                    IconButton(
                        icon: Icon(FontAwesomeIcons.listAlt),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, ListOrder().urlListOrder);
                        })
                  ],
                );
              } else {
                return Text('');
              }
            }()
          ],
          bottom: () {
            if (_currentIndex == 0) {
              return PreferredSize(
                preferredSize: Size.square(50),
                child: Container(
                  padding: EdgeInsets.only(bottom: 5),
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: InkWell(
                    onTap: (){
                      buildShowModalBottomSheet(context);
                    },
                    child: TextField(
                      onChanged: (value) {
                        searchValue = value;
                        // productsListBloc.inputStreamSearchInput.add(value);
                      },
                      decoration: InputDecoration(
                          fillColor: GREENWHITE,
                          filled: true,
                          prefixIcon: InkWell(
                              onTap: (){
                                showModalBottomSheet(context: context, builder: (context) {
                                  return ShopBottomSheet(searchQuery: searchValue,);
                                },);
                              },
                              child: Icon(Icons.search)),
                          hintText: 'Bạn tìm gì hôm nay?',
                          contentPadding: EdgeInsets.all(15)),
                    ),
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
            icon: Icon(CupertinoIcons.shopping_cart, size: 28.0),
            title: Text("Cart"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera, size: 28.0),
            title: Text("Quét"),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell_solid, size: 28.0),
            title: Text("Thông báo"),
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
