import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/product.dart';
import 'package:ExpShop/widget/ListProduct.dart';
import 'package:ExpShop/widget/ListScrollHori.dart';
import 'package:flutter/material.dart';

class PageRecommendV2 extends StatelessWidget {
  final String urlPageRecommendV2 = '/PageRecommendV2';
  ProductItem productItem;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = ModalRoute.of(context).settings.arguments;
    this.productItem = arguments["productItem"];
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: GREEN,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Top Bán chạy',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Tên sản phẩm',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              Text(
                                'Top xu hướng mới nhất',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Cập nhật sản phẩm mỗi ngày',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          // Container(
                          //   width: 100,
                          //   height: 100,
                          //   color: Colors.black,
                          // )
                        ],
                      ),
                    ),
                    Container(
                      child: CardProductHori(
                        productItem: productItem,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: GREENWHITE,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  CardProductHori(productItem: listProduct[2]),
                  CardProductHori(productItem: listProduct[3]),
                  CardProductHori(productItem: listProduct[5]),
                  CardProductHori(productItem: listProduct[7]),
                  CardProductHori(productItem: listProduct[9]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
