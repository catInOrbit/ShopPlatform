import 'package:ExpShop/bloc/cart/cart_state.dart';
import 'package:ExpShop/fake_data/FAKEDATE.dart';
import 'package:ExpShop/models/product.dart';
import 'package:ExpShop/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirebaseAPI {
  final firestoreInstance = FirebaseFirestore.instance;
  CartState _cartState;
  User _user;

  CartState get cartState => _cartState;

  set cartState(CartState value) {
    _cartState = value;
  }

  FirebaseAPI();

  void saveUserOrders() async {
    var batch = firestoreInstance.batch();
    _cartState.products.forEach((element) {
      var docRef = firestoreInstance
          .collection("users")
          .document("Jj5G7eeMpQwBhC3AE6D3")
          .collection("orders")
          .doc();
      batch.set(docRef,
          {"productID": element.productID, "product": element.toJson()});
    });

  Future<QuerySnapshot> getProducts() async
   {
     CollectionReference ref = firestoreInstance.collection('products');
     QuerySnapshot eventsQuery = await ref.get();
     print("Query found: " + eventsQuery.toString());
      return eventsQuery;
   }



  Future<DocumentSnapshot> getUserWithToken(String token) async
  {
    DocumentSnapshot documentSnapshot = await firestoreInstance.collection("users").document(token).get();
      return documentSnapshot;
  }


  Future<QuerySnapshot> getProductsPriceAscending() async
  {
    await batch.commit();
  }

  Future<QuerySnapshot> getProducts() async {
    CollectionReference ref = firestoreInstance.collection('products');
    QuerySnapshot eventsQuery = await ref.get();
    print("Query found: " + eventsQuery.toString());
    return eventsQuery;
  }

  void deleteProductItems(String docID) async {
    await firestoreInstance.collection("products").doc(docID).delete();

    print("Deleted!");
  }

  Future<QuerySnapshot> getProductsPriceAscending() async {
    CollectionReference ref = firestoreInstance.collection('products');
    QuerySnapshot eventsQuery =
        await ref.orderBy("price", descending: false).get();
    print("Query found: " + eventsQuery.toString());
    return eventsQuery;
  }

  Future<QuerySnapshot> getCategories() async {
    CollectionReference ref = firestoreInstance.collection('categories');
    QuerySnapshot eventsQuery =
        await ref.orderBy("categoryID", descending: false).get();
    print("Query found: " + eventsQuery.toString());
    return eventsQuery;
  }

  Future<QuerySnapshot> getProductsWithContraint(int categoryID) async {
    CollectionReference ref = firestoreInstance.collection('products');
    QuerySnapshot eventsQuery =
        await ref.where("categoryID", isEqualTo: categoryID).get();
    print("Query found: " + eventsQuery.toString());
    return eventsQuery;
  }

  Future<QuerySnapshot> getAllStores() async {
    CollectionReference ref = firestoreInstance.collection('stores');
    QuerySnapshot eventsQuery = await ref.get();
    print("Query store found: " + eventsQuery.toString());
    return eventsQuery;
  }

  Future<QuerySnapshot> getProductsWithSearchQuery(String searchString) async {
    List<String> searchStrings = [searchString];
    List<String> searchStringsEnd = [searchString + "\uf8ff"];

    CollectionReference ref = firestoreInstance.collection('products');
    QuerySnapshot eventsQuery = await ref
        .orderBy('productName', descending: true)
        .startAt(searchStrings)
        .endAt(searchStringsEnd)
        .get();
    print("Search query found: " + eventsQuery.toString());
    return eventsQuery;
  }

  Stream<QuerySnapshot> getAllCategories() {
    return firestoreInstance
        .collection('categories')
        .orderBy("categoryID", descending: false)
        .snapshots();
  }

  Future<QuerySnapshot> getAllProductByStore(int storeID) async {
    return await firestoreInstance
        .collection('products')
        .where("storeID", isEqualTo: storeID)
        .get();
  }

  void saveProduct(ProductItem element) async {
    var batch = firestoreInstance.batch();
    var docRef = firestoreInstance.collection("products").doc();
    batch.set(docRef, {
      "productID": element.productID,
      "productName": element.productName,
      "categoryID": element.categoryID,
      "storeID": element.storeID,
      "price": element.price,
      "like": element.like,
      "describe": element.describe,
      "color": element.color != null ? element.color.toString() : null,
      "promotionalPrice": element.promotionalPrice,
      "image": element.image,
      "rating": element.rating,
      "isRating": element.isRating,
      "quantity": element.quantity,
      "km": element.km,
      "expirationDate": element.expirationDate,
    });

    await batch.commit();
  }

  void updateProductsItem(ProductItem element, String docID) async {
    var batch = firestoreInstance.batch();
    var docRef = firestoreInstance.collection("products").doc(docID);
    batch.set(docRef, {
      "productID": element.productID,
      "productName": element.productName,
      "categoryID": element.categoryID,
      "storeID": element.storeID,
      "price": element.price,
      "like": element.like,
      "describe": element.describe,
      "color": element.color != null ? element.color.toString() : null,
      "promotionalPrice": element.promotionalPrice,
      "image": element.image,
      "rating": element.rating,
      "isRating": element.isRating,
      "quantity": element.quantity,
      "km": element.km,
      "expirationDate": element.expirationDate,
    });

    await batch.commit();
  }

  void saveProducts() async {
    var batch = firestoreInstance.batch();
    listProduct.forEach((element) {
      var docRef = firestoreInstance.collection("products").doc();
      batch.set(docRef, {
        "productID": element.productID,
        "productName": element.productName,
        "categoryID": element.categoryID,
        "storeID": element.storeID,
        "price": element.price,
        "like": element.like,
        "describe": element.describe,
        "color": element.color != null ? element.color.toString() : null,
        "promotionalPrice": element.promotionalPrice,
        "image": element.image,
        "rating": element.rating,
        "isRating": element.isRating,
        "quantity": element.quantity,
        "km": element.km,
        "expirationDate": element.expirationDate,
      });
    });

    await batch.commit();
  }

  void saveStores() async {
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

  void saveUsers() async
  {
    var batch = firestoreInstance.batch();
    listUser.forEach((element) {
      var storeRef = firestoreInstance.collection("users").doc();
      element.documentReference = storeRef.id;
      batch.set(storeRef, element.toJson());
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
