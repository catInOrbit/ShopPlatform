import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notification extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [card, card, card, card, card, card, card],
      ),
    );
  }
}

Widget card = Padding(
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
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, left: 5),
                  child: Text(
                    'Mung ngay black friday',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5),
                  height: 48,
                  child: Text(
                      'Giam truc truc bla bla blaGia blaGiam truc truc bla bla blaGia blaGiam truc truc bla bla blaGia blaGiam truc truc bla bla blaGia bla'),
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

Widget cardProduct = Padding(
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
