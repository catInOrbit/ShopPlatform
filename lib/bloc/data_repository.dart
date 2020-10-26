import 'package:ExpShop/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository
{
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection("products");

  Stream<QuerySnapshot> getStream()
  {
    return collectionReference.snapshots();
  }

  Future<DocumentReference> addProduct(ProductItem product)
  {
    // return collectionReference.add(product.toJson());
  }

}