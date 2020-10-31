import 'package:ExpShop/bloc/firebase_api.dart';
import 'package:ExpShop/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository
{
  final firebaseAPI  = FirebaseAPI();
  Future<QuerySnapshot> getAllProducts() => firebaseAPI.getProducts();

  List<ProductItem> queriedList = [];
}