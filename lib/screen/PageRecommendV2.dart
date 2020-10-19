import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/widget/ListProduct.dart';
import 'package:ExpShop/widget/ListScrollHori.dart';
import 'package:flutter/material.dart';

class PageRecommendV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      child: CardProductHori(),
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
                  CardProductHori(),
                  CardProductHori(),
                  CardProductHori(),
                  CardProductHori(),
                  CardProductHori(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
