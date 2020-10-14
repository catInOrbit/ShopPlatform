import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget listLikeProducts(BuildContext context) {
  return Container(
    decoration: BoxDecoration(color: Colors.grey),
    child: GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 197 / 300,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      children: <Widget>[
        cardProduct(context),
        cardProduct(context),
        cardProduct(context),
        cardProduct(context),
        cardProduct(context),
        cardProduct(context),
        cardProduct(context),
        cardProduct(context),
        cardProduct(context),
        cardProduct(context),
        cardProduct(context),
        cardProduct(context),
      ],
    ),
  );
}

Widget listHomeProducts(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          cardProductHomePage(context),
          cardProductHomePage(context),
          cardProductHomePage(context),
          cardProductHomePage(context),
          cardProductHomePage(context),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          cardProductHomePage(context),
          cardProductHomePage(context),
          cardProductHomePage(context),
          cardProductHomePage(context),
          cardProductHomePage(context),
        ],
      ),
    ],
  );
}

Widget cardProductHomePage(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 5),
    child: cardProduct(context),
  );
}

Widget cardProduct(BuildContext context) {
  return Container(
    color: Colors.white,
    width: MediaQuery.of(context).size.width * 0.48,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.5,
              color: Colors.green[50],
            ),
            Positioned(
              top: MediaQuery.of(context).size.width * 0.5 -
                  MediaQuery.of(context).size.height * 0.06,
              left: MediaQuery.of(context).size.height * 0.19,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text('3km'),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue,
                ),
                width: MediaQuery.of(context).size.width * 0.13,
                height: MediaQuery.of(context).size.height * 0.04,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.07,
            child: Text(
              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: <Widget>[
              Icon(
                CupertinoIcons.heart,
                size: 20,
                color: Colors.red[200],
              ),
              Text('(230 lượt)'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            '25.000 đ',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
          ),
        ),
      ],
    ),
  );
}
