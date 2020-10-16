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
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BigCardMostPopularV2(),
                    BigCardMostPopularV2(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MiniCardMostPopularV2(),
                  MiniCardMostPopularV2(),
                  MiniCardMostPopularV2(),
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
  const MiniCardMostPopularV2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class BigCardMostPopularV2 extends StatelessWidget {
  const BigCardMostPopularV2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          height: MediaQuery.of(context).size.width * 0.457 -
              MediaQuery.of(context).size.height * 0.007,
          width: MediaQuery.of(context).size.width * 0.457,
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * (0.457 - 0.3) / 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Colors.blue,
            ),
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        ),
      ],
    );
  }
}
