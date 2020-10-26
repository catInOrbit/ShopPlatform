import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/ProductDetail',
            arguments: {'productItem': productItem});
      },
      child: Container(
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      '3km',
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black.withOpacity(0.4),
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
                height: MediaQuery.of(context).size.height * 0.04,
                child: Text(
                  productItem.productName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Nguyễn đình chiều, Q1...',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '${oCcy.format(productItem.price)} đ',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '${oCcy.format(productItem.promotionalPrice)} đ',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
              ),
            ),
          ],
        ),
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
                        child: Text('3.3KM-Q1, Nguyen dinh chieu , Hhcm'),
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
                        child: Text(
                          'Giá sốc: ${oCcy.format(productItem.promotionalPrice)}đ',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
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
