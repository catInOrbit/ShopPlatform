import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/models/store.dart';
import 'package:ExpShop/widget/CardMostPopularV1.dart';
import 'package:ExpShop/widget/ListProduct.dart';
import 'package:ExpShop/widget/ListScrollHori.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool isClickHeart = false;
  Store _store;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = ModalRoute.of(context).settings.arguments;
    this._store = arguments["store"];
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(background: null),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    width: 200,
                    child: Container(
                      padding: EdgeInsets.only(top: 30, left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Container(
                          //   width: 100,
                          //   height: 100,
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       Container(
                          //         padding: EdgeInsets.all(20),
                          //         width: 70,
                          //         height: 70,
                          //         color: Colors.black,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 70,
                              height: 70,
                              child: Image.asset(_store.urlImage,
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Container(
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_store.storeName,
                                    style: TextStyle(
                                      fontSize: 20,
                                    )),
                                Text('132 lượt thích'),
                                SizedBox(
                                  width: 240,
                                  child: Text(
                                    'Đia chỉ: ' + _store.address,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isClickHeart = !isClickHeart;
                                  });
                                },
                                icon: isClickHeart
                                    ? Icon(FontAwesomeIcons.solidHeart,
                                        color: Colors.red)
                                    : Icon(FontAwesomeIcons.heart,
                                        color: Colors.black),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                ListHoriScrollForShop(),
                CardMostPopular(),
                ListProductHomePage2Column(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
