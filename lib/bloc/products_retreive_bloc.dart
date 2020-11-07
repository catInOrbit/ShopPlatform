import 'package:ExpShop/bloc/data_repository.dart';
import 'package:ExpShop/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class ProductRetreiveBloc
{
   final _repository = DataRepository();
   final _productsSnapshotOutputStream = ReplaySubject<QuerySnapshot>();
   final _categoriesOutputStream = ReplaySubject<QuerySnapshot>();
   final _shopsOutputStream = ReplaySubject<QuerySnapshot>();
   final _inputStream = BehaviorSubject<String>();

   Stream<QuerySnapshot> get productsSnapshotOutputStream => _productsSnapshotOutputStream.stream;
   Stream<QuerySnapshot> get categoriesOutputStream => _categoriesOutputStream.stream;
   Stream<QuerySnapshot> get shopsOutputStream => _shopsOutputStream.stream;
   Stream<String> get searchInputStream => _inputStream.stream;

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
      _productsSnapshotOutputStream.sink.add(querySnapshot);
   }

   void getAllCategories() async
   {
      QuerySnapshot querySnapshot = await _repository.getAllCategories();
      _categoriesOutputStream.sink.add(querySnapshot);
   }

   void getProductsWithContraint(int categoryID) async
   {
      QuerySnapshot querySnapshot = await _repository.getProductsWithContraints(categoryID);
      _productsSnapshotOutputStream.sink.add(querySnapshot);
   }

   void getAllShops() async
   {
      QuerySnapshot querySnapshot = await _repository.getAllStores();
      _productsSnapshotOutputStream.sink.add(querySnapshot);
   }

   void getProductsWithQuery() async
   {
       String querry = await _inputStream.stream.last;
       QuerySnapshot querySnapshot = await _repository.getSearchedProducts(querry);
       _productsSnapshotOutputStream.sink.add(querySnapshot);
   }

   dispose() {
      _productsSnapshotOutputStream.close();
      _categoriesOutputStream.close();
      _shopsOutputStream.close();
      _inputStream.close();
   }

}

final productsListBloc = ProductRetreiveBloc();