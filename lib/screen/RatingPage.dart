import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/product.dart';
import 'package:ExpShop/widget/ListProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingPage extends StatelessWidget {
  ProductItem _productItem;
  final String urlRatingPage = "/RatingPage";
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = ModalRoute.of(context).settings.arguments;
    this._productItem = arguments["productItem"];
    return Scaffold(
      appBar: AppBar(
        title: Text('Đánh giá'),
      ),
      body: Center(
        child: Column(
          children: [
            CardOrderProduct(
              productItem: _productItem,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Container(
                color: Colors.grey[1000],
                child: Column(
                  children: [
                    RatingBar(
                      initialRating:
                          _productItem.isRating ? _productItem.rating : 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    Container(
                      height: 155,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Đánh giá của bạn',
                        ),
                        maxLines: 5,
                      ),
                    ),
                    Container(
                        color: GREEN,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('GỬI ĐÁNH GIÁ')))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
