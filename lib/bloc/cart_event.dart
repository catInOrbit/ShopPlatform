import 'package:ecommerce_int2/models/product.dart';

class CartEvent
{
   bool _requestAddToCart, _requestCheckout;
   String _selectedProductId;
   Product _selectedProduct;


   CartEvent(this._requestAddToCart, this._requestCheckout,
      this._selectedProductId, this._selectedProduct);


   Product get selectedProduct => _selectedProduct;

  set selectedProduct(Product value) {
    _selectedProduct = value;
  }

  get requestCheckout => _requestCheckout;

  set requestCheckout(value) {
    _requestCheckout = value;
  }

  bool get requestAddToCart => _requestAddToCart;

  set requestAddToCart(bool value) {
    _requestAddToCart = value;
  }

   String get selectedProductId => _selectedProductId;

  set selectedProductId(String value) {
    _selectedProductId = value;
  }
}