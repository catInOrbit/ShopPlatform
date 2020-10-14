import 'package:ExpShop/menuItem.dart';
import 'package:flutter/material.dart';

class TabMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 100),
              child: Column(
                children: [
                  Text(
                    'ABCSs SOTE',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text('V1.0'),
                ],
              ),
            ),
            itemMenu(context, 20, 20, 0, 0),
            itemMenu(context, 0, 0, 0, 0),
            itemMenu(context, 0, 0, 0, 0),
            itemMenu(context, 0, 0, 20, 20),
          ],
        ),
      ),
    );
  }
}
