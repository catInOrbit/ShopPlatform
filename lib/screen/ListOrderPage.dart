import 'package:ExpShop/bloc/global.dart';
import 'package:ExpShop/bloc/products_retreive_bloc.dart';
import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/product.dart';
import 'package:ExpShop/widget/ListProduct.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ListOrder extends StatelessWidget {
  final String urlListOrder = '/ListOrder';

  @override
  Widget build(BuildContext context) {
    productsListBloc.getAllProductByOrders(currentUser.documentReference);
    return StreamBuilder<QuerySnapshot>(
        stream: productsListBloc.productsByOrders,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: GREENWHITE,
              child: ListView(
                children: snapshot.data.docs
                    .map((e) => CardOrderProduct(
                          productItem: ProductItem().ProductFromJson(e.data()),
                        ))
                    .toList(),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
// CardOrderProduct(productItem: listProduct[2]),
