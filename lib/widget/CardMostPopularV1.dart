import 'package:ExpShop/fake_data/Colors.dart';
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
            child: Text(
              'Hom nay co gi hot',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
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
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRnY8632GkkduThr4OCgMH15bdWKU15ux2x-w&usqp=CAU',
                          fit: BoxFit.cover,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      height: MediaQuery.of(context).size.width * 0.3 * 2,
                      width: MediaQuery.of(context).size.width * 0.3,
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
                      ItemMostPopular(),
                      ItemMostPopular(),
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
                      ItemMostPopular(),
                      ItemMostPopular(),
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
  const ItemMostPopular({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://s3.us-east-2.amazonaws.com/ordersapp/business/5660348/items/hamberger.jpg',
            fit: BoxFit.cover,
          )),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: MediaQuery.of(context).size.width * 0.3 -
          MediaQuery.of(context).size.height * 0.007,
      width: MediaQuery.of(context).size.width * 0.3,
    );
  }
}
