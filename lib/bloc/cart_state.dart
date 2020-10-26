
import 'package:ExpShop/models/product.dart';

class CartState
{
   List<ProductItem> products = [];

   void addToCart(ProductItem product)
   {
     if(products.contains(product))
         products[products.indexOf(product)].quantityInCart + 1;
      else
        products.add(product);
   }
}