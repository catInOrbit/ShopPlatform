import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/categoryProduct.dart';
import 'package:flutter/material.dart';

class CategoryFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardCategory(categoryProduct: listCagory[0]),
              CardCategory(categoryProduct: listCagory[1]),
              CardCategory(categoryProduct: listCagory[2]),
              CardCategory(categoryProduct: listCagory[3]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardCategory(categoryProduct: listCagory[4]),
              CardCategory(categoryProduct: listCagory[5]),
              CardCategory(categoryProduct: listCagory[6]),
              CardCategory(categoryProduct: listCagory[7]),
            ],
          ),
        ],
      ),
    );
  }
}

class CardCategory extends StatelessWidget {
  final CategoryProduct categoryProduct;
  CardCategory({Key key, this.categoryProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              child: Image.asset(categoryProduct.urlImage),
            ),
            Text(categoryProduct.categoryName),
          ],
        ),
      ),
    );
  }
}
