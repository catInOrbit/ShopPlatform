import 'package:ExpShop/fake_data/Colors.dart';
import 'package:flutter/material.dart';

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
      height: 220,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gia soc hom nay',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  '10:10:10 >',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ProductHoriScroll(),
                ProductHoriScroll(),
                ProductHoriScroll(),
                ProductHoriScroll(),
                ProductHoriScroll(),
                ProductHoriScroll(),
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
                  ProductHoriScrollReCommendV1(),
                  ProductHoriScrollReCommendV1(),
                  ProductHoriScrollReCommendV1(),
                  ProductHoriScrollReCommendV1(),
                  ProductHoriScrollReCommendV1(),
                  ProductHoriScrollReCommendV1(),
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
  const ProductHoriScroll({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
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
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      'https://salt.tikicdn.com/cache/280x280/ts/product/81/ad/70/71b74d9613e4fe23690c17dd6726466b.jpg',
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
                    '-38%',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            Text(
              '10.000',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  color: Colors.black),
            ),
            Text(
              '10.000',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}

class ProductHoriScrollReCommendV1 extends StatelessWidget {
  const ProductHoriScrollReCommendV1({
    Key key,
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
                child: Image.network(
                  'https://salt.tikicdn.com/cache/280x280/ts/product/81/ad/70/71b74d9613e4fe23690c17dd6726466b.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              '10.000',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
