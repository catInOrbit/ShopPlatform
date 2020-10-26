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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            width: 70,
                            height: 70,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Tên cửa hàng', style: TextStyle(fontSize: 20)),
                          Text('132 lượt thích'),
                          Text('Địa chỉ'),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            print("ok");
                          },
                          icon: Icon(FontAwesomeIcons.heart),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
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
