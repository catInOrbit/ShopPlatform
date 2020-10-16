import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Widget listLikeProducts(BuildContext context) {
//   return
// }

class ListProductHomePage2Column extends StatelessWidget {
  const ListProductHomePage2Column({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardProductHomePage(),
            CardProductHomePage(),
            CardProductHomePage(),
            CardProductHomePage(),
            CardProductHomePage(),
            CardProductHomePage(),
            CardProductHomePage(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardProductHomePage(),
            CardProductHomePage(),
            CardProductHomePage(),
            CardProductHomePage(),
            CardProductHomePage(),
            CardProductHomePage(),
            CardProductHomePage(),
          ],
        ),
      ],
    );
  }
}

class CardProductHomePage extends StatelessWidget {
  const CardProductHomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: CardProduct(),
    );
  }
}

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                color: Colors.green[50],
              ),
              Positioned(
                top: MediaQuery.of(context).size.width * 0.5 -
                    MediaQuery.of(context).size.height * 0.06,
                left: MediaQuery.of(context).size.height * 0.19,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text('3km'),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue,
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
              height: MediaQuery.of(context).size.height * 0.07,
              child: Text(
                'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: <Widget>[
                Icon(
                  CupertinoIcons.heart,
                  size: 20,
                  color: Colors.red[200],
                ),
                Text('(230 lượt)'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              '25.000 đ',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
            ),
          ),
        ],
      ),
    );
  }
}

class CardProductHori extends StatelessWidget {
  const CardProductHori({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
              decoration: BoxDecoration(
                color: Colors.red,
              ),
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
                            'Mung ngay black friday',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Am thuc',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(CupertinoIcons.heart_solid),
                        Text('(15 like) - 3.3 km'),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Text('Q1, Nguyen dinh chieu , Hhcm'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text('Ngay : 20/20/20'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
