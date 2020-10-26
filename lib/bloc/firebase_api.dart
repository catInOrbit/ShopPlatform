import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_int2/bloc/cart_state.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/models/user.dart';

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
        var docRef = firestoreInstance.collection("users").document(user.documentReference).
        collection("orders").doc();
        batch.set(docRef, {"productID": element.id});
     });

     await batch.commit();
   }

  User get user => _user;

  set user(User value) {
    _user = value;
  }
}