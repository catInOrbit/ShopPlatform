import 'package:ExpShop/app_properties.dart';
import 'package:ExpShop/models/product.dart';
import 'package:flutter/material.dart';

class ShopProduct extends StatelessWidget {
  final ProductItem product;
  final Function onRemove;

  const ShopProduct(this.product,{Key key,this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          children: <Widget>[
            ShopProductDisplay(product,onPressed: onRemove,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.productName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkGrey,
                ),
              ),
            ),
            Text(
              '\$${product.price}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: darkGrey, fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ],
        ));
  }
}

class ShopProductDisplay extends StatelessWidget {
  final ProductItem product;
  final Function onPressed;

  const ShopProductDisplay(this.product,{Key key,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 200,
      child: Stack(children: <Widget>[
        Positioned(
          left: 25,
          child: SizedBox(
            height: 150,
            width: 150,
            child: Transform.scale(
              scale: 1.2,
              child: Image.asset('assets/icons/bottom_yellow.png'),
            ),
          ),
        ),
        Positioned(
          left: 50,
          top: 5,
          child: SizedBox(
              height:80,
              width: 80,
              child: Image.network('${product.image}',fit: BoxFit.contain,)),
        ),
      ]),
    );
  }
}
