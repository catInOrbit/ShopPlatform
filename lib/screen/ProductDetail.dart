import 'package:ExpShop/bloc/cart_bloc.dart';
import 'package:ExpShop/bloc/cart_event.dart';
import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/models/product.dart';
import 'package:ExpShop/screen/FindTheWayPage.dart';
import 'package:ExpShop/shop/check_out_page.dart';
import 'package:ExpShop/widget/ListProduct.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatelessWidget {
  final String urlProductDetail = "/ProductDetail";
  ProductItem _productItem;
  @override
  Widget build(BuildContext context) {
    final oCcy = new NumberFormat("#,##0", "en_US");
    Map<String, dynamic> arguments = ModalRoute.of(context).settings.arguments;
    this._productItem = arguments["productItem"];
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                _productItem.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Cửa hàng gần bạn  ',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17)),
                              ImageIcon(
                                AssetImage('assets/icons/checked.png'),
                                color: GREEN,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 5),
                            child: Text('${_productItem.productName}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 26)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text('Đồ ăn - Thực phẩm',
                                style: TextStyle(color: Colors.grey)),
                          ),
                          Text('82 Nguyễn Thị Minh Khai, Phường 6, Quận 3'),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 15,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, '/FindWay"');
                          Navigator.of(context).pushNamed('/FindWay');
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          child: Image.asset('assets/icons/map.png'),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('\$\$\$\$',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: GOLD)),
                          Text(
                            '${oCcy.format(_productItem.price)} đ',
                            style: TextStyle(fontSize: 17),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('3 KM',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Text('Khoảng cách'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'HSD',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          ),
                          Text('20/10/2020'),
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          CartEvent event = CartEvent();
                          event.requestAddToCart = true;
                          event.requestCheckout = false;
                          event.selectedProduct = _productItem;
                          cartBloc.querySink.add(event);

                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => CheckOutPage(),
                          ));
                        },
                        child: Column(
                          children: [
                            InkWell(

                              child: Icon(
                                FontAwesomeIcons.cartPlus,
                                color: YELLOWGREEN,
                              ),
                            ),
                            Text('Thêm vào giỏ'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey))),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/vinhphuc.jpg'),
                        ),
                      ),
                      Text('Vĩnh Phúc',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Đang mở',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ListProductHomePage2Column(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
