import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ListProduct.dart';

class CardMostPopularV3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: WHITE,
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
                      'Sản phẩm ưu tiên cho bạn',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Row(
                      children: [
                        Text(
                          'Giá rẻ nhất ',
                          style: TextStyle(color: Colors.green, fontSize: 20),
                        ),
                        Icon(
                          FontAwesomeIcons.check,
                          color: Colors.green,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Gần bạn nhất ',
                          style: TextStyle(color: Colors.green, fontSize: 20),
                        ),
                        Icon(
                          FontAwesomeIcons.check,
                          color: Colors.green,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Phổ biến nhất ',
                          style: TextStyle(color: Colors.green, fontSize: 20),
                        ),
                        Icon(
                          FontAwesomeIcons.check,
                          color: Colors.green,
                        )
                      ],
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
              productItem: listProduct[0],
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }
}
