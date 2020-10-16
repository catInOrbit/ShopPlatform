import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  final String nameItemMenu;
  const ItemMenu({
    Key key,
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.nameItemMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          nameItemMenu,
          style:
              TextStyle(fontSize: MediaQuery.of(context).size.height * 0.032),
        ),
      ),
    );
  }
}
