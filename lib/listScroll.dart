import 'package:flutter/material.dart';

class ListSroll extends StatefulWidget {
  @override
  _ListSrollState createState() => _ListSrollState();
}

class _ListSrollState extends State<ListSroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.green,
            height: 220,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gia soc hom nay',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '10:10:10 >',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.pink,
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      cardProduct(),
                      cardProduct(),
                      cardProduct(),
                      cardProduct(),
                      cardProduct(),
                      cardProduct(),
                      cardProduct(),
                      cardProduct(),
                      cardProduct(),
                      cardProduct(),
                      cardProduct(),
                      cardProduct(),
                      cardProduct(),
                      cardProduct(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget listScrollHori() {
  return Container(
    color: Colors.green,
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
          color: Colors.pink,
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              cardProduct(),
              cardProduct(),
              cardProduct(),
              cardProduct(),
              cardProduct(),
              cardProduct(),
              cardProduct(),
              cardProduct(),
              cardProduct(),
              cardProduct(),
              cardProduct(),
              cardProduct(),
              cardProduct(),
              cardProduct(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget cardProduct() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      color: Colors.blue,
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
                  color: Colors.red,
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
                fontSize: 14, fontWeight: FontWeight.w200, color: Colors.black),
          ),
          Text(
            '10.000',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
          )
        ],
      ),
    ),
  );
}
