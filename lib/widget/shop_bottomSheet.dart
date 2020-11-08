import 'package:ExpShop/bloc/products_retreive_bloc.dart';
import 'package:ExpShop/components/shop_product.dart';
import 'package:ExpShop/models/product.dart';
import 'package:ExpShop/shop/check_out_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShopBottomSheet extends StatefulWidget {
  final String searchQuery;

  const ShopBottomSheet({Key key, this.searchQuery}) : super(key: key);
  @override
  _ShopBottomSheetState createState() => _ShopBottomSheetState();
}

class _ShopBottomSheetState extends State<ShopBottomSheet> {
 @override
  void initState() {
   productsListBloc.getAllProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
        stream: productsListBloc.productsSnapshotOutputStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasData)
          return Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.9),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24), topLeft: Radius.circular(24))),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Image.asset(
                        'assets/images/box.png',
                        height: 24,
                        width: 24.0,
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {},
                      iconSize: 48,
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: getProductsWithQuery(widget.searchQuery, snapshot.data).length,
                        itemBuilder: (_, index) {
                          return ShopProduct(getProductsWithQuery(widget.searchQuery, snapshot.data)[index],onRemove: (){
                            setState(() {
                            });
                          },);

                        }),
                  ),
                ],
              ));
          else
            return Center(child: CircularProgressIndicator(),);
        }
    );
  }

  List<ProductItem> getProductsWithQuery(String querySearch, QuerySnapshot querySnapshot)
  {
    List<ProductItem> returnList = [];
    querySnapshot.docs.forEach((element) {
      print("Checking string match in product with querry: " + querySearch);
      ProductItem productItem = ProductItem().ProductFromJson(element.data());
      if(productItem.productName.toUpperCase().contains(querySearch.toUpperCase()))
        returnList.add(productItem);
    });

    print("return list: " + returnList.length.toString());

    return returnList;

  }
}