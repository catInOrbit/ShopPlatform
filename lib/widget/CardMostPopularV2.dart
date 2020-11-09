import 'package:ExpShop/bloc/products_retreive_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/product.dart';
import 'package:ExpShop/models/store.dart';
import 'package:ExpShop/screen/PageRecommendV2.dart';
import 'package:ExpShop/screen/ProductDetail.dart';

class CardMostPopularV2 extends StatelessWidget {
  const CardMostPopularV2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: productsListBloc.shopsOutputStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData)
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
                          ' Cửa hàng',
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
                            bottom: MediaQuery
                                .of(context)
                                .size
                                .height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BigCardMostPopularV2(store: Store().StoreFromJson(
                                snapshot.data.docs[0].data())),
                            BigCardMostPopularV2(store: Store().StoreFromJson(
                                snapshot.data.docs[1].data())),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MiniCardMostPopularShopV2(
                            store: Store().StoreFromJson(snapshot.data.docs[2]
                                .data()),
                          ),
                          MiniCardMostPopularShopV2(
                            store: Store().StoreFromJson(snapshot.data.docs[3]
                                .data()),
                          ),
                          MiniCardMostPopularShopV2(
                            store: Store().StoreFromJson(snapshot.data.docs[4]
                                .data()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          return
            Center(child: CircularProgressIndicator(),);
        }
    );
  }
}

class ListNearesProdct extends StatefulWidget {
  const ListNearesProdct({
    Key key,
  }) : super(key: key);

  @override
  _ListNearesProdctState createState() => _ListNearesProdctState();
}

class _ListNearesProdctState extends State<ListNearesProdct> {

  @override
  void initState()
  {
    productsListBloc.getAllProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: productsListBloc.productsSnapshotOutputStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.hasData)
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
                        BigNearesProdct(productItem: ProductItem().ProductFromJson(snapshot.data.docs[0].data())),
                        BigNearesProdct(productItem: ProductItem().ProductFromJson(snapshot.data.docs[1].data())),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MiniCardMostPopularV2(
                          productItem: ProductItem().ProductFromJson(snapshot.data.docs[2].data()), kilometer: 'Cách 1 km'),
                      MiniCardMostPopularV2(
                          productItem: ProductItem().ProductFromJson(snapshot.data.docs[3].data()), kilometer: 'Cách 2 km'),
                      MiniCardMostPopularV2(
                          productItem: ProductItem().ProductFromJson(snapshot.data.docs[4].data()), kilometer: 'Cách 3 km'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
        else
          return Center( child: CircularProgressIndicator(),);
      }
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

class MiniCardMostPopularShopV2 extends StatelessWidget {
  final Store store;
  final String kilometer;
  const MiniCardMostPopularShopV2({
    Key key,
    this.store,
    this.kilometer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/ShopPage", arguments: {'store': store});
      },
      child: Stack(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  store.urlImage,
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
                    store.storeName,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
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
        Navigator.pushNamed(context, "/ShopPage", arguments: {'store': store});
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
                    Container(
                      height: 18,
                      width: 120,
                      child: Text(
                        '${store.address}',
                        style: TextStyle(color: WHITE),
                      ),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: store.shopColor.withOpacity(0.9),
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
