import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_int2/models/product.dart';

class DataRepository
{
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection("products");

  Stream<QuerySnapshot> getStream()
  {
    return collectionReference.snapshots();
  }

  Future<DocumentReference> addProduct(Product product)
  {
    return collectionReference.add(product.toJson());
  }

}