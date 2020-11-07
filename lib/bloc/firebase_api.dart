import 'package:ExpShop/bloc/cart_state.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirebaseAPI
{
  final firestoreInstance = FirebaseFirestore.instance;
  CartState _cartState;
  User _user;


  CartState get cartState => _cartState;

  set cartState(CartState value) {
    _cartState = value;
  }

  FirebaseAPI();

  void saveUserOrders() async
   {
     var batch = firestoreInstance.batch();
     _cartState.products.forEach((element) {
        var docRef = firestoreInstance.collection("users").document("Jj5G7eeMpQwBhC3AE6D3").
        collection("orders").doc();
        batch.set(docRef, {"productID": element.productID, "product" : element.toJson()});
     });

     await batch.commit();
   }




  Future<QuerySnapshot> getProducts() async
   {
     CollectionReference ref = firestoreInstance.collection('products');
     QuerySnapshot eventsQuery = await ref.get();
     print("Query found: " + eventsQuery.toString());
      return eventsQuery;
   }

  Future<QuerySnapshot> getCategories() async
  {
    CollectionReference ref = firestoreInstance.collection('categories');
    QuerySnapshot eventsQuery = await ref.orderBy("categoryID", descending: false).get();
    print("Query found: " + eventsQuery.toString());
    return eventsQuery;
  }

  Future<QuerySnapshot> getProductsWithContraint(int categoryID) async
  {
    CollectionReference ref = firestoreInstance.collection('products');
    QuerySnapshot eventsQuery = await ref.where("categoryID", isEqualTo: categoryID).get();
    print("Query found: " + eventsQuery.toString());
    return eventsQuery;
  }

  Future<QuerySnapshot> getAllStores() async
  {
      CollectionReference ref = firestoreInstance.collection('stores');
      QuerySnapshot eventsQuery = await ref.get();
      print("Query found: " + eventsQuery.toString());
      return eventsQuery;
  }

  Future<QuerySnapshot> getProductsWithSearchQuery(String searchString) async
  {
    CollectionReference ref = firestoreInstance.collection('products');
    QuerySnapshot eventsQuery = await ref.where('productName', isGreaterThanOrEqualTo:  searchString).where('productName', isLessThanOrEqualTo:  searchString+'\uf8ff').get();
    print("Query found: " + eventsQuery.toString());
    return eventsQuery;
  }


  void saveProducts() async
  {
    var batch = firestoreInstance.batch();
    listProduct.forEach((element) {
      var docRef = firestoreInstance.collection("products").doc();
      batch.set(docRef, {
          "productID": element.productID,
        "productName" : element.productName,
        "categoryID" : element.categoryID,
        "storeID" : element.storeID,
        "price" : element.price,
        "like" : element.like,
        "describe" : element.describe,
        "color" : element.color != null ? element.color.toString() : null,
        "promotionalPrice" : element.promotionalPrice,
        "image" : element.image,
        "rating" : element.rating,
        "isRating" : element.isRating,
        "quantity" : element.quantity,
        "km": element.km,
      });
    });

    await batch.commit();
  }

  void saveStores() async
  {
    var batch = firestoreInstance.batch();
    listStore.forEach((element) {
      var storeRef = firestoreInstance.collection("stores").doc();
      batch.set(storeRef, element.toJson());

      listProduct.forEach((element) {
        var productREf = storeRef.collection("products").doc();
          batch.set(productREf, element.toJson());
      });
    });

    await batch.commit();
  }
  //
  // void saveCategory() async
  // {
  //   var batch = firestoreInstance.batch();
  //   listCategory.forEach((element) {
  //     var docRef = firestoreInstance.collection("categories").doc();
  //     batch.set(docRef, {"categoryID": element.categoryID, "categoryName" : element.categoryName,
  //       "urlImage" : element.urlImage
  //     });
  //   });
  //
  //   await batch.commit();
  // }


  User get user => _user;

  set user(User value) {
    _user = value;
  }
}