import 'package:ExpShop/bloc/cart_state.dart';
import 'package:ExpShop/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        batch.set(docRef, {"productID": element.productID});
     });

     await batch.commit();
   }

  User get user => _user;

  set user(User value) {
    _user = value;
  }
}