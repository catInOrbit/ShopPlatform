import 'package:ExpShop/widget/WidgetMenu.dart';
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
            ItemMenu(
              topLeft: 20,
              topRight: 20,
              bottomLeft: 0,
              bottomRight: 0,
              nameItemMenu: 'Điều khoản',
            ),
            ItemMenu(
              topLeft: 0,
              topRight: 0,
              bottomLeft: 0,
              bottomRight: 0,
              nameItemMenu: '',
            ),
            ItemMenu(
              topLeft: 0,
              topRight: 0,
              bottomLeft: 0,
              bottomRight: 0,
              nameItemMenu: '',
            ),
            ItemMenu(
              topLeft: 0,
              topRight: 0,
              bottomLeft: 20,
              bottomRight: 20,
              nameItemMenu: 'Đăng xuất',
            ),
          ],
        ),
      ),
    );
  }
}
