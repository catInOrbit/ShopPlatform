import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              itemMenu(context, 20, 20, 0, 0),
              itemMenu(context, 0, 0, 0, 0),
              itemMenu(context, 0, 0, 0, 0),
              itemMenu(context, 0, 0, 20, 20),
            ],
          ),
        ),
      ),
    );
  }
}

Widget itemMenu(BuildContext context, double topLeft, double topRight,
    double bottomLeft, double bottomRight) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 1),
    child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * 0.014,
          vertical: MediaQuery.of(context).size.height * 0.021),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Text(
        'Goi YGoi ',
        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.032),
      ),
    ),
  );
}
