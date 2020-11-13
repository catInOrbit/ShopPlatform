
import 'dart:async';

import 'package:ExpShop/bloc/authentication/authentication_bloc.dart';
import 'package:ExpShop/bloc/cart/cart_event.dart';
import 'package:ExpShop/bloc/cart/cart_state.dart';
import 'package:ExpShop/bloc/firebase_api.dart';
import 'package:ExpShop/bloc/global.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc
{
    final FirebaseAPI firebaseAPI = FirebaseAPI();
    final CartState _cartState = CartState();

    final _outputStreamController = StreamController<CartState>.broadcast();
    final _inputStreamController = StreamController<CartEvent>();

    Stream<CartState> get outputState => _outputStreamController.stream;
    StreamSink<CartEvent> get querySink => _inputStreamController.sink;

    CartState get cartState => _cartState;

  CartBloc()
    {
       void onEventChanged(CartEvent _cartEvent)
        {
           if(_cartEvent.requestAddToCart)
           {
             _cartState.addToCart(_cartEvent.selectedProduct);
             print("Product added to cart: " + _cartEvent.selectedProduct.toString());

           }

           else if(_cartEvent.requestCheckout)
           {
             firebaseAPI.cartState = _cartState;
             firebaseAPI.user = currentUser;
             print("ABOUT TO SAVE TO: " + currentUser.documentReference.toString());
              firebaseAPI.saveUserOrders(currentUser.documentReference.toString());
             _cartState.products.clear();
           }

           _outputStreamController.sink.add(_cartState);
           print("Output sink added");
        }
       _inputStreamController.stream.listen(onEventChanged);

    }

    @override
    void dispose()
    {
      _inputStreamController.close();
      _outputStreamController.close();
    }

}

final cartBloc = CartBloc();

class CartBlocProvider extends InheritedWidget {
  final CartBloc cartBloc;
  final Widget child;

  CartBlocProvider({Key key, @required this.cartBloc, this.child})
      : super(key: key, child: child);

  static CartBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CartBlocProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    throw UnimplementedError();
  }
}