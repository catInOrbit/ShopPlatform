import 'dart:async';

import 'package:ExpShop/bloc/data_repository.dart';
import 'package:ExpShop/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class ProductRetreiveBloc
{
   final _repository = DataRepository();
   final _productsSnapshotOutputStream = ReplaySubject<QuerySnapshot>();
   final _productsOutputStream = ReplaySubject<List<ProductItem>>();
   final _categoriesOutputStream = ReplaySubject<QuerySnapshot>();
   final _shopsOutputStream = ReplaySubject<QuerySnapshot>();
   final _searchInputStream = BehaviorSubject<String>();

  StreamSink<String> get inputStreamSearchInput => _searchInputStream.sink;
   BehaviorSubject<String> get inputStreamSearchOutput => _searchInputStream.stream;

  Stream<QuerySnapshot> get productsSnapshotOutputStream => _productsSnapshotOutputStream.stream;
   Stream<List<ProductItem>> get productsOutputStream => _productsOutputStream.stream;
   Stream<QuerySnapshot> get categoriesOutputStream => _categoriesOutputStream.stream;
   Stream<QuerySnapshot> get shopsOutputStream => _shopsOutputStream.stream;

  ProductRetreiveBloc()
   {
      // getAllProduct();

   }

   void getAllProduct() async
   {
      QuerySnapshot querySnapshot = await _repository.getAllProducts();
      // querySnapshot.docs.forEach((element) {
      //    print("Add item: " + ProductItem().ProductFromJson(element.data()).productName + "to sink");
      //    _productsOutputStream.sink.add(ProductItem().ProductFromJson(element.data()));
      // });
      _productsSnapshotOutputStream.sink.add(querySnapshot);
   }

   void getAllCategories() async
   {
      QuerySnapshot querySnapshot = await _repository.getAllCategories();
      _categoriesOutputStream.sink.add(querySnapshot);
   }

   void getProductsWithContraint(int categoryID) async
   {
      QuerySnapshot querySnapshot = await _repository.getProductsWithContraints(categoryID);
      _productsSnapshotOutputStream.sink.add(querySnapshot);
   }

   void getAllShops() async
   {
      QuerySnapshot querySnapshot = await _repository.getAllStores();
      _productsSnapshotOutputStream.sink.add(querySnapshot);
   }

   void getProductsWithQuery() async
   {
      List<ProductItem> streamList = [];
       String querry = await _searchInputStream.stream.last;
       QuerySnapshot querySnapshot = await _repository.getAllProducts();

       querySnapshot.docs.forEach((element) {
         print("Checking string match in product");
         ProductItem productItem =ProductItem().ProductFromJson(element.data());
          if(productItem.productName.contains(querry))
            streamList.add(productItem);
         print("Product added to matched query list");

       });

       if(streamList.isNotEmpty)
          _productsOutputStream.sink.add(streamList);
   }

   dispose() {
      _productsSnapshotOutputStream.close();
      _categoriesOutputStream.close();
      _shopsOutputStream.close();
      _searchInputStream.close();
      _productsOutputStream.close();
   }

}

final productsListBloc = ProductRetreiveBloc();