import 'package:ExpShop/bloc/products_retreive_bloc.dart';
import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// class Suggest1 extends StatefulWidget {
//   @override
//   _Suggest1State createState() => _Suggest1State();
// }

// class _Suggest1State extends State<Suggest1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           containerItems(context),
//         ],
//       ),
//     );
//   }
// }

class CardMostPopular extends StatefulWidget {
  const CardMostPopular({
    Key key,
  }) : super(key: key);

  @override
  _CardMostPopularState createState() => _CardMostPopularState();
}

class _CardMostPopularState extends State<CardMostPopular> {
  @override
  void initState() {
    productsListBloc.getLowestPriceProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: productsListBloc.productsLowestPriceSnapshotOutputStream,
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
                      width: 20,
                      height: 20,
                      child: Image.asset('assets/icons/trophy.png'),
                    ),
                    Text(
                      'Sản phẩm giá rẻ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/PageRecommendV1");
                        },
                        child: Stack(
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                   ProductItem().ProductFromJson(snapshot.data.docs[0].data()).image,
                                  fit: BoxFit.cover,
                                  scale: 1,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              height: MediaQuery.of(context).size.width * 0.3 * 2,
                              width: MediaQuery.of(context).size.width * 0.3,
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(ProductItem().ProductFromJson(snapshot.data.docs[0].data()).productName,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.blue,
                                        Colors.blue.withOpacity(0)
                                      ]),
                                ),
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.width * 0.3 * 1.2,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.3 * 2,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ItemMostPopular(
                            productItem: ProductItem().ProductFromJson(snapshot.data.docs[1].data()),
                            color: Colors.red,
                            typeOfProduct: ProductItem().ProductFromJson(snapshot.data.docs[1].data()).productName,
                          ),
                          ItemMostPopular(
                            productItem: ProductItem().ProductFromJson(snapshot.data.docs[2].data()),
                            color: Colors.black,
                            typeOfProduct: ProductItem().ProductFromJson(snapshot.data.docs[2].data()).productName,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.3 * 2,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ItemMostPopular(
                            productItem:  ProductItem().ProductFromJson(snapshot.data.docs[3].data()),
                            color: Colors.pink,
                            typeOfProduct:  ProductItem().ProductFromJson(snapshot.data.docs[2].data()).productName,
                          ),
                          ItemMostPopular(
                            productItem:  ProductItem().ProductFromJson(snapshot.data.docs[2].data()),
                            color: Colors.blue,
                            typeOfProduct:  ProductItem().ProductFromJson(snapshot.data.docs[2].data()).productName,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
        else
          return Center(child: CircularProgressIndicator(),);
      }
    );
  }
}

class CardMostPopularForShop extends StatelessWidget {
  const CardMostPopularForShop({
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
                  child: Image.asset('assets/icons/trophy.png'),
                ),
                Text(
                  'Top loại sản phẩm giá rẻ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/PageRecommendV1");
                    },
                    child: Stack(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/topphobien.jpg',
                              fit: BoxFit.cover,
                              scale: 1,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          height: MediaQuery.of(context).size.width * 0.3 * 2,
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text('Top giá sốc',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.blue,
                                    Colors.blue.withOpacity(0)
                                  ]),
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                            height:
                                MediaQuery.of(context).size.width * 0.3 * 1.2,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.3 * 2,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ItemMostPopular(
                        productItem: listProduct[2],
                        color: Colors.red,
                        typeOfProduct: 'Nước ngọt',
                      ),
                      ItemMostPopular(
                        productItem: listProduct[6],
                        color: Colors.black,
                        typeOfProduct: 'Đóng hộp',
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.3 * 2,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ItemMostPopular(
                        productItem: listProduct[1],
                        color: Colors.pink,
                        typeOfProduct: 'Cá hộp',
                      ),
                      ItemMostPopular(
                        productItem: listProduct[8],
                        color: Colors.blue,
                        typeOfProduct: 'Phô mai',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemMostPopular extends StatelessWidget {
  final String typeOfProduct;
  final Color color;
  final ProductItem productItem;
  const ItemMostPopular({
    Key key,
    this.productItem,
    this.color,
    this.typeOfProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/PageRecommendV2',
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
                )),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            height: MediaQuery.of(context).size.width * 0.3 -
                MediaQuery.of(context).size.height * 0.007,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(typeOfProduct,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text('(123 sản phẩm)', style: TextStyle(color: Colors.white)),
              ],
            ),
            height: MediaQuery.of(context).size.width * 0.3 -
                MediaQuery.of(context).size.height * 0.007,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [color.withOpacity(0.5), color.withOpacity(0)]),
            ),
          ),
        ],
      ),
    );
  }
}
