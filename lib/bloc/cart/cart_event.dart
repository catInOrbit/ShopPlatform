
import 'package:ExpShop/models/product.dart';

class CartEvent
{
   bool _requestAddToCart, _requestCheckout, _removeSelected;
   String _selectedProductId;
   ProductItem _selectedProduct;


   get removeSelected => _removeSelected;

   set removeSelected(value) {
     _removeSelected = value;
   }
   // CartEvent(this._requestAddToCart, this._requestCheckout,
   //    this._selectedProductId, this._selectedProduct);

   ProductItem get selectedProduct => _selectedProduct;

  set selectedProduct(ProductItem value) {
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