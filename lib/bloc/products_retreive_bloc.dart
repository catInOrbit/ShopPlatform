import 'package:ExpShop/bloc/data_repository.dart';
import 'package:ExpShop/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class ProductRetreiveBloc
{
   final _repository = DataRepository();
   final _productsOutputStream = ReplaySubject<QuerySnapshot>();
   final _categoriesOutputStream = ReplaySubject<QuerySnapshot>();

   Stream<QuerySnapshot> get productsOutputStream => _productsOutputStream.stream;
   Stream<QuerySnapshot> get categoriesOutputStream => _categoriesOutputStream.stream;

   ProductRetreiveBloc()
   {
      // getAllProduct();
   }

   void getAllProduct() async
   {
      QuerySnapshot querySnapshot = await _repository.getAllProducts();
      // querySnapshot.docs.forEach((element) {
      //    print("Add item: " + ProductItem().ProductFromJson(element.data()).productName + "to sink");
      //    _productsOutputStream.sink.add(ProductItem().ProductFromJson(element.data()));
      // });
      _productsOutputStream.sink.add(querySnapshot);
   }

   void getAllCategories() async
   {
      QuerySnapshot querySnapshot = await _repository.getAllCategories();
      _categoriesOutputStream.sink.add(querySnapshot);
   }

   void getProductsWithContraint(int categoryID) async
   {
      QuerySnapshot querySnapshot = await _repository.getProductsWithContraints(categoryID);
      _productsOutputStream.sink.add(querySnapshot);
   }

   dispose() {
      _productsOutputStream.close();
      _categoriesOutputStream.close();
   }

}

final productsListBloc = ProductRetreiveBloc();