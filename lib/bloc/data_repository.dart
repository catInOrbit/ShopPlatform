import 'package:ExpShop/bloc/firebase_api.dart';
import 'package:ExpShop/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository {
  final firebaseAPI = FirebaseAPI();
  Future<QuerySnapshot> getAllProducts() => firebaseAPI.getProducts();
  Future<QuerySnapshot> getAllCategories() => firebaseAPI.getCategories();
  Future<QuerySnapshot> getProductsWithContraints(int categoryID) =>
      firebaseAPI.getProductsWithContraint(categoryID);
  Future<QuerySnapshot> getAllStores() => firebaseAPI.getAllStores();
  Future<QuerySnapshot> getLowPriceProducts() =>
      firebaseAPI.getProductsPriceAscending();
  Future<QuerySnapshot> getUserWithToken(String tokenString) =>
      firebaseAPI.getUserWithToken(tokenString);
  Future<QuerySnapshot> getAllProductByStore(String storeID) =>
      firebaseAPI.getAllProductByStore(storeID);

  // Future<QuerySnapshot> getSearchedProducts(String searchString) => firebaseAPI.getProductsWithSearchQuery(searchString);

  List<ProductItem> queriedList = [];
}
