import 'package:ExpShop/bloc/products_retreive_bloc.dart';
import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/categoryProduct.dart';
import 'package:ExpShop/models/product.dart';
import 'package:ExpShop/tab_screen/ListProductInCategory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryFood extends StatefulWidget {
  @override
  _CategoryFoodState createState() => _CategoryFoodState();
}

class _CategoryFoodState extends State<CategoryFood> {
  @override
  void initState() {

    productsListBloc.getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: productsListBloc.categoriesOutputStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.hasData)
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: snapshot.data.docs.map((e) => CardCategory(categoryProduct: CategoryProduct().CategoryFromJson(e.data()),)).toList()
                  ),
                ],
              ),
            ),
          );
        else
          return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class CardCategory extends StatelessWidget {
  final CategoryProduct categoryProduct;
  CardCategory({Key key, this.categoryProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:  InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ListProductInCategory( idCategory: categoryProduct.categoryID,),)),
        child: Container(
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                child: Image.asset(categoryProduct.urlImage),
              ),
              Text(categoryProduct.categoryName),
            ],
          ),
        ),
      ),
    );
  }
}
