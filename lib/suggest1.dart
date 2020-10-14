import 'package:flutter/material.dart';

class Suggest1 extends StatefulWidget {
  @override
  _Suggest1State createState() => _Suggest1State();
}

class _Suggest1State extends State<Suggest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          containerItems(context),
        ],
      ),
    );
  }
}

Widget containerItems(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(bottom: 10),
    color: Colors.red,
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  height: MediaQuery.of(context).size.width * 0.3 * 2,
                  width: MediaQuery.of(context).size.width * 0.3,
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
                    cardContain(context),
                    cardContain(context),
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
                    cardContain(context),
                    cardContain(context),
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

Widget cardContain(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.black,
    ),
    height: MediaQuery.of(context).size.width * 0.3 -
        MediaQuery.of(context).size.height * 0.007,
    width: MediaQuery.of(context).size.width * 0.3,
  );
}
