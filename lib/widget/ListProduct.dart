import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/product.dart';
import 'package:ExpShop/screen/EditProductPage.dart';
import 'package:ExpShop/screen/RatingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

// Widget listLikeProducts(BuildContext context) {
//   return
// }

class ListProductHomePage2Column extends StatelessWidget {
  const ListProductHomePage2Column({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 50,
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                'Có thể bạn sẽ thích',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: listProduct
                  .map((e) => CardProductHomePage(
                        productItem: e,
                      ))
                  .toList(),
              // children: [
              //   CardProductHomePage(),
              //   CardProductHomePage(),
              //   CardProductHomePage(),
              //   CardProductHomePage(),
              //   CardProductHomePage(),
              //   CardProductHomePage(),
              //   CardProductHomePage(),
              // ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: listProduct
                  .map((e) => CardProductHomePage(
                        productItem: e,
                      ))
                  .toList()
                  .reversed
                  .toList(),
              // children: [
              //   CardProductHomePage(),
              //   CardProductHomePage(),
              //   CardProductHomePage(),
              //   CardProductHomePage(),
              //   CardProductHomePage(),
              //   CardProductHomePage(),
              //   CardProductHomePage(),
              // ],
            ),
          ],
        ),
      ],
    );
  }
}

class CardProductHomePage extends StatelessWidget {
  final ProductItem productItem;
  const CardProductHomePage({
    Key key,
    this.productItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: CardProduct(
        productItem: productItem,
      ),
    );
  }
}

class CardProduct extends StatelessWidget {
  final ProductItem productItem;
  const CardProduct({
    Key key,
    this.productItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.48,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/ProductDetail',
                  arguments: {'productItem': productItem});
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.5,
                      child: Image.asset(
                        productItem.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.width * 0.5 -
                          MediaQuery.of(context).size.height * 0.06,
                      left: MediaQuery.of(context).size.height * 0.19,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          productItem.km,
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black.withOpacity(0.4),
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: Text(
                      productItem.productName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: 180,
                    height: 20,
                    child: Text(
                      '50 Tứ Hải, Phường 6, Tân Bình',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      RatingBar(
                        itemSize: 20,
                        initialRating: productItem.rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                      Text('(${productItem.rating})'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Giá gốc: ${oCcy.format(productItem.price)} đ',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              final snackBar = SnackBar(
                content: Text('Thêm thành công'),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.black.withOpacity(0.8),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                padding: EdgeInsets.symmetric(horizontal: 5),
                width: 160,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      FontAwesomeIcons.cartPlus,
                      color: WHITE,
                    ),
                    Text(
                      '|',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: WHITE),
                    ),
                    Text(
                      '${oCcy.format(productItem.promotionalPrice)} đ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: WHITE),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardProductHori extends StatelessWidget {
  final ProductItem productItem;
  const CardProductHori({
    Key key,
    this.productItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/ProductDetail',
              arguments: {'productItem': productItem});
        },
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${productItem.productName}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Đồ ăn',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                            '${productItem.km} - 50 Tứ Hải, Phường 6, Tân Bình'),
                      ),
                      Row(
                        children: [
                          RatingBar(
                            itemSize: 20,
                            initialRating: productItem.rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                          Text('(${productItem.rating})'),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Giá gốc: ${oCcy.format(productItem.price)}đ',
                          style:
                              TextStyle(decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Giá sốc: ${oCcy.format(productItem.promotionalPrice)}đ',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.cartPlus,
                                    color: Colors.green,
                                    size: 20,
                                  ),
                                  Text('  Thêm vào giỏ',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.green)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardProductHoriShop extends StatelessWidget {
  final ProductItem productItem;
  const CardProductHoriShop({
    Key key,
    this.productItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, EditProductPage().urlEditProductPage,
              arguments: {'productItem': productItem});
        },
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${productItem.productName}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Đồ ăn',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                            '${productItem.km} - 50 Tứ Hải, Phường 6, Tân Bình'),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Giá gốc: ${oCcy.format(productItem.price)}đ',
                          style:
                              TextStyle(decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Giá sốc: ${oCcy.format(productItem.promotionalPrice)}đ',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShoppingCardProduct extends StatelessWidget {
  final ProductItem productItem;
  const ShoppingCardProduct({
    Key key,
    this.productItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/ProductDetail',
              arguments: {'productItem': productItem});
        },
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${productItem.productName}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Đồ ăn',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                            '${productItem.km} - 50 Tứ Hải, Phường 6, Tân Bình'),
                      ),
                      Row(
                        children: [
                          RatingBar(
                            itemSize: 20,
                            initialRating: productItem.rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                          Text('(${productItem.rating})'),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Giá gốc: ${oCcy.format(productItem.price)}đ',
                          style:
                              TextStyle(decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Giá sốc: ${oCcy.format(productItem.promotionalPrice)}đ',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            productItem.quantity == 0
                                ? 'Hết hàng'
                                : 'Còn ${productItem.quantity} sản phẩm',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: productItem.quantity == 0
                                    ? Colors.red
                                    : GREEN),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardOrderProduct extends StatelessWidget {
  final ProductItem productItem;
  const CardOrderProduct({
    Key key,
    this.productItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RatingPage().urlRatingPage,
              arguments: {'productItem': productItem});
        },
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${productItem.productName}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Đồ ăn',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                            '${productItem.km} - 50 Tứ Hải, Phường 6, Tân Bình'),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text('Ngày mua: 31/10/2020'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Giá đơn hàng: ${oCcy.format(productItem.promotionalPrice)}đ',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                          ),
                          () {
                            if (productItem.isRating) {
                              return Text(
                                'Đã đánh giá',
                                style: TextStyle(color: Colors.green),
                              );
                            } else {
                              return Text(
                                'Chưa đánh giá',
                                style: TextStyle(color: Colors.black),
                              );
                            }
                          }()
                          // Text(
                          //   productItem.isRating
                          //       ? 'Đã đánh giá'
                          //       : 'Chưa đánh giá',
                          //   style: TextStyle(
                          //       fontStyle: FontStyle.italic,
                          //       color: productItem.quantity == 0
                          //           ? Colors.red
                          //           : GREEN),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
