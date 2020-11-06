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
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (ctx) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          AppBar(
                            title: Text('Điều khoản'),
                            backgroundColor: WHITE,
                          ),
                          Text(
                              'Tất cả các nhận xét, đề xuất, ý tưởng, đồ hoạ hoặc các thông tin khác được gửi đến 7-Eleven Việt Nam thông qua Trang Điện Tử này sẽ là tài sản thuộc sở hữu của 7-Eleven Việt Nam. 7-Eleven Việt Nam sẽ không bắt buộc phải xem xét bất kỳ thông tin nào được gửi đến chúng tôi thông qua Trang Điện Tử này là bí mật và sẽ không chịu trách nhiệm về bất kỳ ý tưởng nào cho việc kinh doanh đó (bao gồm nhưng không giới hạn, sản phẩm hoặc ý tưởng quảng cáo) và sẽ không chịu bất kỳ trách nhiệm pháp lý nào cho bất kỳ điểm giống nhau có thể xuất hiện trong các hoạt động tương lai của 7-Eleven Việt Nam. 7-Eleven Việt Nam sẽ có quyền sở hữu độc quyền và tất cả các quyền khác (ở cả hiện tại và tương lai) với các thông tin được gửi đến 7-Eleven Việt Nam dưới bất cứ hình thức nào (văn bản, hình ảnh) thông qua Trang Điện Tử này. 7-Eleven Việt Nam sẽ được quyền sử dụng những thông tin gửi đến chúng tôi cho bất kỳ mục đích thương mại hay mục đích nào khác mà không phải bồi thường thiệt hại cho bạn hay bất kỳ người nào khác gửi thông tin đến. Thông tin cá nhân được cung cấp tự nguyện bởi một khách hàng truy cập hay sử dụng Trang Điện Tử. Thông tin này sẽ được ghi nhận và sử dụng cho mục đích nội bộ và không được bán hoặc chuyển giao cho bất kỳ một bên thứ ba nào hoặc các đơn vị khác không tham gia vào hoạt động của Trang Điện Tử cũng như của 7-Eleven Việt Nam. Người dùng sẽ chịu trách nhiệm cho bất cứ thông tin nào (dưới bất cứ hình thức gì) gửi đến 7‑Eleven Việt Nam bao gồm tính hợp pháp, độ tin cậy, tình phù hợp, tính nguyên bản cũng như bản quyền.'),
                        ],
                      ),
                    );
                  },
                );
              },
              child: ItemMenu(
                topLeft: 20,
                topRight: 20,
                bottomLeft: 0,
                bottomRight: 0,
                nameItemMenu: 'Điều khoản',
              ),
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
                Navigator.pop(context);
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
