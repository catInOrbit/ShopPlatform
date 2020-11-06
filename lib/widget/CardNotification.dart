import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ExpShop/models/product.dart';

class CardNotification extends StatelessWidget {
  final String title;
  final String describe;
  final ProductItem productItem;
  const CardNotification({
    Key key,
    this.title,
    this.describe,
    this.productItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black26),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(),
              child: Image.asset(productItem.image, fit: BoxFit.fill),
            ),
            Expanded(
              child: Container(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, left: 5),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      height: 48,
                      child: Text(describe),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text('Ngay : 20/20/20'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
