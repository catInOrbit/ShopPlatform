import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/widget/WidgetMenu.dart';
import 'package:flutter/material.dart';

class TabMenuSHopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: GREENWHITE,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 100),
              child: Column(
                children: [
                  Text(
                    'ExpShop',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: GREEN),
                  ),
                  Text('v1.0'),
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
              nameItemMenu: 'Danh sách của hàng',
            ),
            ItemMenu(
              topLeft: 0,
              topRight: 0,
              bottomLeft: 0,
              bottomRight: 0,
              nameItemMenu: 'Đánh giá ứng dụng',
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/LoginPage');
              },
              child: ItemMenu(
                topLeft: 0,
                topRight: 0,
                bottomLeft: 20,
                bottomRight: 20,
                nameItemMenu: 'Đăng xuất',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
