import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/widget/ListProduct.dart';
import 'package:flutter/material.dart';

class ListOrder extends StatelessWidget {
  final String urlListOrder = '/ListOrder';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đơn hàng'),
      ),
      body: ListView(
        children: [
          CardOrderProduct(productItem: listProduct[2]),
          CardOrderProduct(productItem: listProduct[8]),
          CardOrderProduct(productItem: listProduct[4]),
          CardOrderProduct(productItem: listProduct[0]),
          CardOrderProduct(productItem: listProduct[6]),
          CardOrderProduct(productItem: listProduct[2]),
          CardOrderProduct(productItem: listProduct[8]),
          CardOrderProduct(productItem: listProduct[4]),
          CardOrderProduct(productItem: listProduct[0]),
          CardOrderProduct(productItem: listProduct[6]),
        ],
      ),
    );
  }
}
