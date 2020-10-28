
import 'package:ExpShop/app_properties.dart';
import 'package:ExpShop/bloc/cart_bloc.dart';
import 'package:ExpShop/bloc/cart_event.dart';
import 'package:ExpShop/bloc/cart_state.dart';
import 'package:ExpShop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'components/credit_card.dart';
import 'components/shop_item_list.dart';

//TODO: NOT DONE. WHEEL SCROLL QUANTITY
class CheckOutPage extends StatefulWidget {

  const CheckOutPage({Key key}) : super(key: key);
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  SwiperController swiperController = SwiperController();

  List<ProductItem> products = [
    ProductItem(
        productID: 6,
        productName: 'Ngũ cốc',
        categoryID: 5,
        storeID: 2,
        price: 50000,
        like: 100,
        describe: '',
        promotionalPrice: 26000,
        image: 'assets/images/ngucoc.jpg'),
    ProductItem(
        productID: 7,
        productName: 'Pate Gan Ngỗng',
        categoryID: 7,
        storeID: 2,
        price: 45000,
        like: 100,
        describe: '',
        promotionalPrice: 30000,
        image: 'assets/images/pateganngong.jpg'),
    ProductItem(
        productID: 7,
        productName: 'Nước giải khác Pepsi',
        categoryID: 6,
        storeID: 2,
        price: 12000,
        like: 100,
        describe: '',
        promotionalPrice: 7000,
        image: 'assets/images/pepsi.jpg'),
  ];

  void checkout()
  {
    CartEvent cartEvent = CartEvent();
    cartEvent.requestCheckout = true;
    cartEvent.requestAddToCart = false;

    cartBloc.querySink.add(cartEvent);
  }
  @override
  Widget build(BuildContext context) {
    Widget checkOutButton = InkWell(
      onTap: () => {
        print("Checking out"),
        checkout()
      },
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Check Out",
              style: const TextStyle(
                  color: const Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: darkGrey),
        actions: <Widget>[
          // IconButton(
          //   icon: Image.asset('assets/icons/denied_wallet.png'),
          //     onPressed: () {},
          // )
        ],
        title: Text(
          'Checkout',
          style: TextStyle(
              color: darkGrey, fontWeight: FontWeight.w500, fontSize: 18.0),
        ),
      ),
      body: StreamBuilder(
        initialData: cartBloc.cartState,
        stream: cartBloc.outputState,
        builder: (context, snapshot){
          CartState state = snapshot.data;
          return  LayoutBuilder(
            builder: (_, constraints) => SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      height: 48.0,
                      color: green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Subtotal',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            state.products.length.toString() + ' items',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: Scrollbar(
                        child: ListView.builder(
                          itemBuilder: (_, index) => ShopItemList(state.products[index],onRemove: (){
                            setState(() {
                              state.products.remove(state.products[index]);
                            });
                          },),
                          itemCount: state.products.length,
                        ),
                      ),
                    ),

                    SizedBox(height: 24),
                    Center(
                        child: checkOutButton)
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}

class Scroll extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    LinearGradient grT = LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);
    LinearGradient grB = LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter);

    canvas.drawRect(
        Rect.fromLTRB(0, 0, size.width, 30),
        Paint()
          ..shader = grT.createShader(Rect.fromLTRB(0, 0, size.width, 30)));

    canvas.drawRect(Rect.fromLTRB(0, 30, size.width, size.height - 40),
        Paint()..color = Color.fromRGBO(50, 50, 50, 0.4));

    canvas.drawRect(
        Rect.fromLTRB(0, size.height - 40, size.width, size.height),
        Paint()
          ..shader = grB.createShader(
              Rect.fromLTRB(0, size.height - 40, size.width, size.height)));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
