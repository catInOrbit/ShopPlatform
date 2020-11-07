import 'package:ExpShop/bloc/products_retreive_bloc.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Widget listLikeProducts(BuildContext context) {
//   return
// }

class ListProductInCategory extends StatefulWidget {

  final int idCategory;
  const ListProductInCategory({Key key, this.idCategory}) : super(key: key);


  @override
  _ListProductInCategoryState createState() => _ListProductInCategoryState();
}

class _ListProductInCategoryState extends State<ListProductInCategory> {
  @override
  void initState()
  {
    productsListBloc.getProductsWithContraint(widget.idCategory);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: productsListBloc.productsSnapshotOutputStream,
        builder: (context,  AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasData)
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: 50,
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          'Có thể bạn sẽ thích',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )),

                  Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: snapshot.data.docs.map((e) => CardProductHomePage(productItem: ProductItem().ProductFromJson(e.data()),)).toList()
                  )
                ],
              ),
            );
          else
            return Center(child: CircularProgressIndicator());
        },

      ),
    );
  }

  List<ProductItem> getProductList(QuerySnapshot querySnapshot)
  {

  }

}


class CardProductHomePage extends StatelessWidget {
  final ProductItem productItem;
  const CardProductHomePage({
    Key key,
    this.productItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: CardProduct(
        productItem: productItem,
      ),
    );
  }
}

class CardProduct extends StatelessWidget {
  final ProductItem productItem;
  const CardProduct({
    Key key,
    this.productItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/ProductDetail',
            arguments: {'productItem': productItem});
      },
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.48,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: Image.asset(
                    productItem.image,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.5 -
                      MediaQuery.of(context).size.height * 0.06,
                  left: MediaQuery.of(context).size.height * 0.19,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      '3km',
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    width: MediaQuery.of(context).size.width * 0.13,
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.04,
                child: Text(
                  productItem.productName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Nguyễn đình chiều, Q1...',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '${oCcy.format(productItem.price)} đ',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '${oCcy.format(productItem.promotionalPrice)} đ',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardProductHori extends StatelessWidget {
  final ProductItem productItem;
  const CardProductHori({
    Key key,
    this.productItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/ProductDetail',
              arguments: {'productItem': productItem});
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black26),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(),
                child: Image.asset(productItem.image, fit: BoxFit.fill),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${productItem.productName}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Đồ ăn',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text('3.3KM-Q1, Nguyen dinh chieu , Hhcm'),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Giá gốc: ${oCcy.format(productItem.price)}đ',
                          style:
                          TextStyle(decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Giá sốc: ${oCcy.format(productItem.promotionalPrice)}đ',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
