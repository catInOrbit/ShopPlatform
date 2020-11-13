import 'package:ExpShop/bloc/firebase_api.dart';
import 'package:ExpShop/bloc/global.dart';
import 'package:ExpShop/bloc/products_retreive_bloc.dart';
import 'package:ExpShop/fake_data/Colors.dart';

import 'package:ExpShop/models/product.dart';

import 'package:ExpShop/widget/ListProduct.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TabHomeShopPage extends StatefulWidget {
  @override
  _TabHomeShopPageState createState() => _TabHomeShopPageState();
}

class _TabHomeShopPageState extends State<TabHomeShopPage> {
  // List cardList = [
  //   Item1(urlBanner: "assets/images/Banner1.jpg"),
  //   Item1(urlBanner: "assets/images/Banner3.jpg"),
  //   Item1(urlBanner: "assets/images/Banner4.jpg"),
  // ];

  Color greenColor = Colors.green;
  // List<ProductItem> listProductItem = List();
  int _currentIndexSlider = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //lay san pham theo store id
    // FirebaseAPI().getAllProductByStore(2).forEach((element) {
    //   element.docs.asMap().forEach((key, value) {

    //     listProductItem
    //         .add(ProductItem().ProductFromJson(element.docs[key].data()));
    //   });
    // });
    productsListBloc.getAllProductByStore(currentUser.shopID);
  }

  @override
  Widget build(BuildContext context) {
    print("ShopHomePage");
    return StreamBuilder<QuerySnapshot>(
      stream: productsListBloc.productsByStoreSnapshotOutputStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Container(
            color: GREENWHITE,
            child: ListView(
              children: snapshot.data.docs
                  .map((e) => DeleteProduct(
                        productItem: ProductItem().ProductFromJson(e.data()),
                        docID: e.reference.documentID,
                      ))
                  .toList(),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class DeleteProduct extends StatelessWidget {
  final ProductItem productItem;
  final String docID;
  const DeleteProduct({
    Key key,
    this.productItem,
    this.docID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: CardProductHoriShop(productItem: productItem, docID: docID),
      secondaryActions: [
        IconSlideAction(
          onTap: () {
            FirebaseAPI().deleteProductItems(docID);
            Navigator.pushNamed(context, "/HomePageShop");
          },
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
        )
      ],
    );
  }
}
