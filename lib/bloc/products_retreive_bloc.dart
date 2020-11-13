import 'dart:async';

import 'package:ExpShop/bloc/data_repository.dart';
import 'package:ExpShop/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class ProductRetreiveBloc {
  final _repository = DataRepository();
  final _productsSnapshotOutputStream = ReplaySubject<QuerySnapshot>();
  final _productsSnapshotInCategoryOutputStream = ReplaySubject<QuerySnapshot>();


  final _productsByStoreSnapshotOutputStream = ReplaySubject<QuerySnapshot>();
  final _productsByOrders = ReplaySubject<QuerySnapshot>();
  final _productsLowestPriceSnapshotOutputStream =
      ReplaySubject<QuerySnapshot>();
  final _productsOutputStream = ReplaySubject<List<ProductItem>>();
  final _categoriesOutputStream = ReplaySubject<QuerySnapshot>();
  final _shopsOutputStream = ReplaySubject<QuerySnapshot>();
  final _searchInputStream = BehaviorSubject<String>();

  Stream<QuerySnapshot> get productsSnapshotInCategoryOutputStream =>
      _productsSnapshotInCategoryOutputStream.stream;
  StreamSink<String> get inputStreamSearchInput => _searchInputStream.sink;
  BehaviorSubject<String> get inputStreamSearchOutput =>
      _searchInputStream.stream;
  Stream<QuerySnapshot> get productsLowestPriceSnapshotOutputStream =>
      _productsLowestPriceSnapshotOutputStream.stream;
  Stream<QuerySnapshot> get productsByOrders => _productsByOrders.stream;

  Stream<QuerySnapshot> get productsSnapshotOutputStream =>
      _productsSnapshotOutputStream.stream;
  Stream<List<ProductItem>> get productsOutputStream =>
      _productsOutputStream.stream;
  Stream<QuerySnapshot> get categoriesOutputStream =>
      _categoriesOutputStream.stream;
  Stream<QuerySnapshot> get shopsOutputStream => _shopsOutputStream.stream;
  Stream<QuerySnapshot> get productsByStoreSnapshotOutputStream =>
      _productsByStoreSnapshotOutputStream.stream;
  ProductRetreiveBloc() {
    // getAllProduct();
  }

  void getAllProduct() async {
    QuerySnapshot querySnapshot = await _repository.getAllProducts();
    // querySnapshot.docs.forEach((element) {
    //    print("Add item: " + ProductItem().ProductFromJson(element.data()).productName + "to sink");
    //    _productsOutputStream.sink.add(ProductItem().ProductFromJson(element.data()));
    // });
    _productsSnapshotOutputStream.sink.add(querySnapshot);
  }

  void getAllProductInCategory() async {
    QuerySnapshot querySnapshot = await _repository.getAllProducts();
    // querySnapshot.docs.forEach((element) {
    //    print("Add item: " + ProductItem().ProductFromJson(element.data()).productName + "to sink");
    //    _productsOutputStream.sink.add(ProductItem().ProductFromJson(element.data()));
    // });
    _productsSnapshotOutputStream.sink.add(querySnapshot);
  }

  void getAllProductByStore(String storeID) async {
    QuerySnapshot querySnapshot =
        await _repository.getAllProductByStore(storeID);
    _productsByStoreSnapshotOutputStream.sink.add(querySnapshot);
  }

  void getAllProductByOrders(String userID) async {
    QuerySnapshot querySnapshot = await _repository.getProductOrders(userID);
    _productsByOrders.sink.add(querySnapshot);
  }

  void getAllCategories() async {
    QuerySnapshot querySnapshot = await _repository.getAllCategories();
    _categoriesOutputStream.sink.add(querySnapshot);
  }

  void getProductsWithContraint(int categoryID) async {
    QuerySnapshot querySnapshot =
        await _repository.getProductsWithContraints(categoryID);
    _productsSnapshotInCategoryOutputStream.sink.add(querySnapshot);
  }

  void getAllShops() async {
    QuerySnapshot querySnapshot = await _repository.getAllStores();
    _shopsOutputStream.sink.add(querySnapshot);
  }

  void getProductsWithQuery() async {
    List<ProductItem> streamList = [];
    String querry = await _searchInputStream.stream.last;
    QuerySnapshot querySnapshot = await _repository.getAllProducts();

    querySnapshot.docs.forEach((element) {
      print("Checking string match in product");
      ProductItem productItem = ProductItem().ProductFromJson(element.data());
      if (productItem.productName.contains(querry)) streamList.add(productItem);
      print("Product added to matched query list");
    });

    if (streamList.isNotEmpty) _productsOutputStream.sink.add(streamList);
  }

  void getLowestPriceProducts() async {
    QuerySnapshot querySnapshot = await _repository.getLowPriceProducts();
    _productsLowestPriceSnapshotOutputStream.sink.add(querySnapshot);
  }

  dispose() {
    _productsSnapshotOutputStream.close();
    _categoriesOutputStream.close();
    _shopsOutputStream.close();
    _searchInputStream.close();
    _productsOutputStream.close();
    _productsLowestPriceSnapshotOutputStream.close();
    _productsByStoreSnapshotOutputStream.close();
    _productsByOrders.close();
    _productsSnapshotInCategoryOutputStream.close();
  }
}

final productsListBloc = ProductRetreiveBloc();
