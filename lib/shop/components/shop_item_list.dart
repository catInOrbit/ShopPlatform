import 'package:ExpShop/app_properties.dart';
import 'package:ExpShop/bloc/cart/cart_bloc.dart';
import 'package:ExpShop/bloc/cart/cart_event.dart';
import 'package:ExpShop/color_list.dart';
import 'package:ExpShop/components/shop_product.dart';
import 'package:ExpShop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:numberpicker/numberpicker.dart';

class ShopItemList extends StatefulWidget {
  final ProductItem product;
  final Function onRemove;

  ShopItemList(this.product, {Key key, this.onRemove}) : super(key: key);

  @override
  _ShopItemListState createState() => _ShopItemListState();
}

class _ShopItemListState extends State<ShopItemList> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Slidable(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          height: 130,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment(0, 0.8),
                child: Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: shadow,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 12.0, right: 12.0),
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.product.productName,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: darkGrey,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: 160,
                                    padding: const EdgeInsets.only(
                                        left: 32.0, top: 8.0, bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        ColorOption(Colors.red),
                                        Text(
                                          '\$${widget.product.price}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: darkGrey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
//TODO: Work on scroll quantity
                          Theme(
                            data: ThemeData(
                                accentColor: Colors.black,
                                textTheme: TextTheme(
                                  headline: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  body1: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    color: Colors.grey[400],
                                  ),
                                )),
                            child: NumberPicker.integer(
                              initialValue: quantity,
                              minValue: widget.product.quantityInCart,
                              maxValue: 100,
                              onChanged: (value) {
                                setState(() {
                                  quantity = value;
                                });
                              },
                              itemExtent: 30,
                              listViewWidth: 40,
                            ),
                          )
                        ])),
              ),
              Positioned(
                  top: 5,
                  child: ShopProductDisplay(
                    widget.product,
                    onPressed: widget.onRemove,
                  )),
            ],
          ),
        ),
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Bỏ',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
               var cartEvent = CartEvent();
               cartEvent.requestAddToCart = false;
               cartEvent.requestCheckout = false;
               cartEvent.removeSelected = true;
               cartEvent.selectedProduct = widget.product;
               cartBloc.querySink.add(cartEvent);
               setState(() {
               });
               Navigator.of(context).pop();
                Navigator.pushNamed(context, "/CheckOutPage");
            }
          ),
        ]);
  }
}
