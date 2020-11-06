import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// class ListSroll extends StatefulWidget {
//   @override
//   _ListSrollState createState() => _ListSrollState();
// }

// class _ListSrollState extends State<ListSroll> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             color: Colors.green,
//             height: 220,
//             child: Column(
//               children: [
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Gia soc hom nay',
//                         style: TextStyle(
//                             fontSize: 25, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         '10:10:10 >',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   color: Colors.pink,
//                   height: 160,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: <Widget>[
//                       ProductHoriScroll(),
//                       ProductHoriScroll(),
//                       ProductHoriScroll(),
//                       ProductHoriScroll(),
//                       ProductHoriScroll(),
//                       ProductHoriScroll(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ListHoriScroll extends StatelessWidget {
  const ListHoriScroll({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WHITE,
      height: 250,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      child: Image.asset('assets/icons/fire.png'),
                    ),
                    Text(
                      'Giảm giá cực sốc',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // Text(
                //   '10:10:10 >',
                //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                // ),
              ],
            ),
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ProductHoriScroll(productItem: listProduct[1]),
                ProductHoriScroll(productItem: listProduct[3]),
                ProductHoriScroll(productItem: listProduct[5]),
                ProductHoriScroll(productItem: listProduct[7]),
                ProductHoriScroll(productItem: listProduct[8]),
                ProductHoriScroll(productItem: listProduct[6]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListHoriScrollForShop extends StatelessWidget {
  const ListHoriScrollForShop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WHITE,
      height: 250,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sản phẩm mới nhất cửa hàng',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ProductHoriScroll(productItem: listProduct[1]),
                ProductHoriScroll(productItem: listProduct[3]),
                ProductHoriScroll(productItem: listProduct[5]),
                ProductHoriScroll(productItem: listProduct[7]),
                ProductHoriScroll(productItem: listProduct[8]),
                ProductHoriScroll(productItem: listProduct[6]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListHoriScrollPageRecommendV1 extends StatelessWidget {
  const ListHoriScrollPageRecommendV1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: GREENWHITE,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 145,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ProductHoriScrollReCommendV1(productItem: listProduct[2]),
                  ProductHoriScrollReCommendV1(productItem: listProduct[8]),
                  ProductHoriScrollReCommendV1(productItem: listProduct[7]),
                  ProductHoriScrollReCommendV1(productItem: listProduct[1]),
                  ProductHoriScrollReCommendV1(productItem: listProduct[0]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductHoriScroll extends StatelessWidget {
  final ProductItem productItem;
  const ProductHoriScroll({Key key, this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final oCcy = new NumberFormat("#,##0", "en_US");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/ProductDetail',
              arguments: {'productItem': productItem});
        },
        child: Container(
          width: 120,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        productItem.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 50,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Text(
                      '${(productItem.promotionalPrice / productItem.price * 100).toInt()}%',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 6,
                    child: Container(
                      height: 20,
                      width: 50,
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: Text(
                          productItem.km,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                '${oCcy.format(productItem.price)} đ',
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: Colors.black),
              ),
              Text(
                '${oCcy.format(productItem.promotionalPrice)} đ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text('Q1,Ho Chi Minh'),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductHoriScrollReCommendV1 extends StatelessWidget {
  final ProductItem productItem;
  const ProductHoriScrollReCommendV1({
    Key key,
    this.productItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 120,
        child: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  productItem.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              '${oCcy.format(productItem.promotionalPrice)} đ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
