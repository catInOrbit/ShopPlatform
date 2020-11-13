import 'package:ExpShop/bloc/cart/cart_bloc.dart';
import 'package:ExpShop/bloc/cart/cart_event.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/shop/check_out_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/models/product.dart';
import 'package:ExpShop/models/user.dart';
import 'package:ExpShop/screen/FindTheWayPage.dart';
import 'package:ExpShop/widget/ListProduct.dart';

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
            expandedHeight: 400,
            stretch: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
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
                          Row(
                            children: [
                              RatingBar(
                                itemSize: 20,
                                initialRating: _productItem.rating,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                              ),
                              Text(
                                '(${_productItem.rating})',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
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
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                              'assets/icons/dong.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          // Text('VNĐ',
                          //     style: TextStyle(
                          //         fontSize: 25,
                          //         fontWeight: FontWeight.bold,
                          //         color: GOLD)),
                          Text(
                            '${oCcy.format(_productItem.price)} đ',
                          )
                        ],
                      ),
                      Column(
                        children: [
                          // Row(
                          //   children: [
                          //     Text('3 KM',
                          //         style: TextStyle(
                          //             fontSize: 25,
                          //             fontWeight: FontWeight.bold)),
                          //   ],
                          // ),
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                              'assets/icons/distance.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text('${_productItem.km}'),
                        ],
                      ),
                      Column(
                        children: [
                          ImageIcon(
                            AssetImage(
                              'assets/icons/hsd.png',
                            ),
                            size: 31,
                            color: Colors.orange,
                          ),
                          // Text(
                          //   'HSD',
                          //   style: TextStyle(
                          //       fontSize: 25,
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.orange),
                          // ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey))),
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Cửa hàng:'),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: 50,
                                height: 50,
                                child:
                                    Image.asset('assets/images/vinhphuc.jpg'),
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
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nhận xét:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Comment(user: listUser[1]),
                        Comment(user: listUser[2]),
                        Comment(user: listUser[0]),
                      ],
                    ),
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

class Comment extends StatelessWidget {
  final User user;
  const Comment({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
        height: 55,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 50,
                height: 50,
                child: Image.asset(user.avatarPicURL),
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user.name,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    RatingBar(
                      itemSize: 20,
                      initialRating: 4.5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                Text("Test comment"),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
