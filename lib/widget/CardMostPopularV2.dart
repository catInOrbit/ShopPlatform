import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/product.dart';
import 'package:ExpShop/models/store.dart';
import 'package:ExpShop/screen/PageRecommendV2.dart';
import 'package:ExpShop/screen/ProductDetail.dart';
import 'package:flutter/material.dart';

// class Suggest2 extends StatefulWidget {
//   @override
//   _Suggest2State createState() => _Suggest2State();
// }

// class _Suggest2State extends State<Suggest2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[],
//       ),
//     );
//   }
// }

class CardMostPopularV2 extends StatelessWidget {
  const CardMostPopularV2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      color: WHITE,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  child: Image.asset('assets/icons/shop.png'),
                ),
                Text(
                  'Cửa hàng và sản phẩm gần bạn',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BigCardMostPopularV2(store: listStore[0]),
                    BigCardMostPopularV2(store: listStore[1]),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MiniCardMostPopularV2(
                      productItem: listProduct[10], kilometer: 'Cách 1 km'),
                  MiniCardMostPopularV2(
                      productItem: listProduct[9], kilometer: 'Cách 2 km'),
                  MiniCardMostPopularV2(
                      productItem: listProduct[7], kilometer: 'Cách 3 km'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListNearesProdct extends StatelessWidget {
  const ListNearesProdct({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      color: WHITE,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  child: Image.asset('assets/icons/gps.png'),
                ),
                Text(
                  'Gần bạn nhất',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BigNearesProdct(productItem: listProduct[16]),
                    BigNearesProdct(productItem: listProduct[15]),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MiniCardMostPopularV2(
                      productItem: listProduct[3], kilometer: 'Cách 1 km'),
                  MiniCardMostPopularV2(
                      productItem: listProduct[4], kilometer: 'Cách 2 km'),
                  MiniCardMostPopularV2(
                      productItem: listProduct[5], kilometer: 'Cách 3 km'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MiniCardMostPopularV2 extends StatelessWidget {
  final ProductItem productItem;
  final String kilometer;
  const MiniCardMostPopularV2({
    Key key,
    this.productItem,
    this.kilometer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PageRecommendV2().urlPageRecommendV2,
            arguments: {'productItem': productItem});
      },
      child: Stack(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  productItem.image,
                  fit: BoxFit.fill,
                  scale: 1,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            height: MediaQuery.of(context).size.width * 0.3 -
                MediaQuery.of(context).size.height * 0.007,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          Container(
              height: MediaQuery.of(context).size.width * 0.3 -
                  MediaQuery.of(context).size.height * 0.007,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.red, Colors.green.withOpacity(0)],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    kilometer,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '(123 sản phẩm)',
                    style: TextStyle(color: WHITE),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class BigCardMostPopularV2 extends StatelessWidget {
  final Store store;
  const BigCardMostPopularV2({
    Key key,
    this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/ShopPage");
      },
      child: Stack(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                store.urlImage,
                fit: BoxFit.fill,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            height: MediaQuery.of(context).size.width * 0.457 -
                MediaQuery.of(context).size.height * 0.007,
            width: MediaQuery.of(context).size.width * 0.457,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      '${store.storeName}',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text('${store.address}', style: TextStyle(color: WHITE)),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: store.shopColors.withOpacity(0.9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
              width: MediaQuery.of(context).size.width * 0.457,
              height: MediaQuery.of(context).size.height * 0.07,
            ),
          )
        ],
      ),
    );
  }
}

class BigNearesProdct extends StatelessWidget {
  final ProductItem productItem;
  const BigNearesProdct({
    Key key,
    this.productItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetail().urlProductDetail,
            arguments: {'productItem': productItem});
      },
      child: Stack(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                productItem.image,
                fit: BoxFit.fill,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            height: MediaQuery.of(context).size.width * 0.457 -
                MediaQuery.of(context).size.height * 0.007,
            width: MediaQuery.of(context).size.width * 0.457,
          ),
          Container(
            height: MediaQuery.of(context).size.width * 0.457 -
                MediaQuery.of(context).size.height * 0.007,
            width: MediaQuery.of(context).size.width * 0.457,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    productItem.color.withOpacity(0.5),
                    Colors.grey.withOpacity(0)
                  ]),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${productItem.productName}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Cách 1km: đường 7A...',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Giá: ${productItem.promotionalPrice}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: productItem.color.withOpacity(0.6),
              ),
              width: MediaQuery.of(context).size.width * 0.457,
              height: MediaQuery.of(context).size.height * 0.08,
            ),
          )
        ],
      ),
    );
  }
}
