import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/product.dart';
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

class CardMostPopular extends StatelessWidget {
  const CardMostPopular({
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
                              child: Text('Sữa tươi',
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
                        loaiSP: 'Nước ngọt',
                      ),
                      ItemMostPopular(
                        productItem: listProduct[6],
                        color: Colors.black,
                        loaiSP: 'Đóng hộp',
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
                        loaiSP: 'Cá hộp',
                      ),
                      ItemMostPopular(
                        productItem: listProduct[8],
                        color: Colors.blue,
                        loaiSP: 'Phô mai',
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
                        loaiSP: 'Nước ngọt',
                      ),
                      ItemMostPopular(
                        productItem: listProduct[6],
                        color: Colors.black,
                        loaiSP: 'Đóng hộp',
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
                        loaiSP: 'Cá hộp',
                      ),
                      ItemMostPopular(
                        productItem: listProduct[8],
                        color: Colors.blue,
                        loaiSP: 'Phô mai',
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
  final String loaiSP;
  final Color color;
  final ProductItem productItem;
  const ItemMostPopular({
    Key key,
    this.productItem,
    this.color,
    this.loaiSP,
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
                Text(loaiSP,
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
