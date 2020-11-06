import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/widget/CardNotification.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          CardNotification(
            productItem: listProduct[1],
            title: 'Giảm giá 50% cho sản phẩm',
            describe:
                'Nhanh chân lên nào! Đến với cửa hàng tại Vĩnh Phúc Store Q1,HCM',
          ),
          CardNotification(
            productItem: listProduct[5],
            title: 'Sale tận 34%! Nhanh Chân lên',
            describe:
                'Mừng ngày kỷ niệm thành lập Hoàng Lộc Store cửa hàng chúng tôi sale 34% cho mỗi khách hàng khi mua sản phẩm',
          ),
        ],
      ),
    );
  }
}
