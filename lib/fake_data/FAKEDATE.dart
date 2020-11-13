import 'package:ExpShop/bloc/firebase_api.dart';
import 'package:ExpShop/fake_data/Colors.dart';
import 'package:ExpShop/models/categoryProduct.dart';
import 'package:ExpShop/models/product.dart';
import 'package:ExpShop/models/store.dart';
import 'package:ExpShop/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<CategoryProduct> listCategory = new List();
Stream<QuerySnapshot> snapshot;
final oCcy = new NumberFormat("#,##0", "en_US");

getAllCategory() async {
  snapshot = await FirebaseAPI().getAllCategories();

  snapshot.forEach((element) {
    element.docs.asMap().forEach((key, value) {
      listCategory.add(CategoryProduct(
        categoryName: element.docs[key]["categoryName"],
        categoryID: element.docs[key]["categoryID"],
      ));
      print(listCategory.length);
    });
  });
}

var listUser = [
  ShopUser("Male", 'Ng. Văn A', "Address1", "test@gmaiil.com", "username01",
      "01234566", "1", 'assets/images/user.png', null),
  ShopUser("Male", 'Ng. Văn A', "Address1", "test@gmaiil.com", "username01",
      "01234566", "1", 'assets/images/user.png', null),
  ShopUser("Male", 'Ng. Văn B', "Address1", "test@gmaiil.com", "username01",
      "01234566", "1", 'assets/images/user2.png', null),
  ShopUser("Male", 'Ng. Văn C', "Address1", "test@gmaiil.com", "username01",
      "01234566", "1", 'assets/images/user3.png', null),
];

var listStore = [
  Store(
      shopColor: GREEN,
      storeID: 1,
      storeName: '7-eleven',
      address: '4 Trường Chinh, Phường 12, Tân Bình, Thành phố Hồ Chí Minh',
      description: '',
      longitude: 0000,
      latitude: 0000,
      phoneNumber: "0123456789",
      urlImage: "assets/images/shop1.jpg"),
  Store(
      shopColor: RED,
      storeID: 2,
      storeName: 'VinMart',
      address: '50 Tứ Hải, Phường 6, Tân Bình, Thành phố Hồ Chí Minh',
      description: '',
      longitude: 0000,
      latitude: 0000,
      phoneNumber: "0123456789",
      urlImage: "assets/images/shop2.jpg"),
  Store(
      shopColor: GREEN,
      storeID: 1,
      storeName: 'Family Mart',
      address:
          '590 Cách Mạng Tháng Tám, Phường 11, Quận 3, Thành phố Hồ Chí Minh',
      description: '',
      longitude: 0000,
      latitude: 0000,
      phoneNumber: "0123456789",
      urlImage: "assets/images/family.jpg"),
  Store(
      shopColor: RED,
      storeID: 2,
      storeName: 'Vinh Phúc',
      address: '319 Lý Thường Kiệt, Phường 15, Quận 11, Thành phố Hồ Chí Minh',
      description: '',
      longitude: 0000,
      latitude: 0000,
      phoneNumber: "0123456789",
      urlImage: "assets/images/vinhphuc.jpg"),
  Store(
      shopColor: RED,
      storeID: 2,
      storeName: 'Hà PHương',
      address: '16A Lê Hồng Phong, Phường 12, Quận 10, Thành phố Hồ Chí Minh',
      description: '',
      longitude: 0000,
      latitude: 0000,
      phoneNumber: "0123456789",
      urlImage: "assets/images/haphuong.png"),
];

// var listCagory = [
//   CategoryProduct(
//       categoryID: 1,
//       categoryName: "Bánh kẹo",
//       urlImage: "assets/icons/candy.png"),
//   CategoryProduct(
//     categoryID: 2,
//     categoryName: "Sữa",
//     urlImage: "assets/icons/milk.png",
//   ),
//   CategoryProduct(
//       categoryID: 4,
//       categoryName: "Đồ ăn nhanh",
//       urlImage: "assets/icons/noodles.png"),
//   CategoryProduct(
//       categoryID: 5,
//       categoryName: "Ngủ cốc",
//       urlImage: "assets/icons/walnut.png"),
//   CategoryProduct(
//       categoryID: 6,
//       categoryName: "Đồ uống",
//       urlImage: "assets/icons/soft-drink.png"),
//   CategoryProduct(
//       categoryID: 7,
//       categoryName: "Đóng hộp",
//       urlImage: "assets/icons/canned-food.png"),
//   CategoryProduct(
//       categoryID: 8,
//       categoryName: "Gia vị",
//       urlImage: "assets/icons/spices.png"),
//   CategoryProduct(
//       categoryID: 3, categoryName: "Khác", urlImage: "assets/icons/menu.png"),
// ];

var listProduct = [
  ProductItem(
      rating: 4.5,
      isRating: true,
      quantity: 15,
      km: '0.2km',
      productID: 1,
      productName: 'Hộp Bò Hầm',
      categoryID: 7,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 34000,
      like: 100,
      describe: '',
      promotionalPrice: 20000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2Fbohamhop.jpg?alt=media&token=41570b95-7329-46da-80dd-e1a5e6cbe2a6'),
  ProductItem(
      rating: 3.5,
      isRating: true,
      quantity: 20,
      km: '0.8km',
      productID: 2,
      productName: 'Cá hộp',
      categoryID: 7,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 12000,
      like: 100,
      describe: '',
      promotionalPrice: 7000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2Fcahop.jpg?alt=media&token=11e4ca72-e0bf-4ea7-b69b-c584da471cc3'),
  ProductItem(
      rating: 3.5,
      isRating: false,
      quantity: 27,
      km: '0.3km',
      productID: 3,
      productName: 'CoCa Cola',
      categoryID: 6,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 14000,
      like: 100,
      describe: ' ',
      promotionalPrice: 7000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2Fcocacola.jpg?alt=media&token=521b2f40-f7f3-445f-b855-7b74af1215a8'),
  ProductItem(
      rating: 4.2,
      isRating: true,
      quantity: 0,
      km: '0.7km',
      productID: 4,
      productName: 'Hạt Nêm Knorr',
      categoryID: 8,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 60000,
      like: 100,
      describe: '',
      promotionalPrice: 30000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2FhatniemKnorr.jpg?alt=media&token=dd750ab5-a9ea-4a87-a658-7104c9acc7ce'),
  ProductItem(
      rating: 3.4,
      isRating: false,
      quantity: 0,
      km: '0.4km',
      productID: 5,
      productName: 'Mật Ong Xuân Nguyên',
      categoryID: 3,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 200000,
      like: 100,
      describe: 'c',
      promotionalPrice: 130000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2Fmatong.jpg?alt=media&token=36958744-7bb3-4bf1-b5de-1a2f9c24f206'),
  ProductItem(
      rating: 4.2,
      isRating: true,
      quantity: 32,
      km: '0.6km',
      productID: 6,
      productName: 'Ngũ cốc',
      categoryID: 5,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 50000,
      like: 100,
      describe: '',
      promotionalPrice: 26000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2Fngucoc.jpg?alt=media&token=8115bf98-371c-46a2-9fcf-133c38726ed8'),
  ProductItem(
      rating: 4.0,
      isRating: false,
      quantity: 45,
      km: '0.5km',
      productID: 7,
      productName: 'Pate Gan Ngỗng',
      categoryID: 7,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 45000,
      like: 100,
      describe: '',
      promotionalPrice: 30000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2Fpateganngong.jpg?alt=media&token=f021fa0b-b38a-4ced-85f4-9762e4f93a3a'),
  ProductItem(
      rating: 3.5,
      isRating: true,
      quantity: 14,
      km: '2.1km',
      productID: 7,
      productName: 'Nước giải khác Pepsi',
      categoryID: 6,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 12000,
      like: 100,
      describe: '',
      promotionalPrice: 7000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2Fpepsi.jpg?alt=media&token=308fa047-7be8-4a6e-8391-c3ebfe5ebfdd'),
  ProductItem(
      rating: 5.0,
      isRating: false,
      quantity: 0,
      km: '2.8km',
      productID: 7,
      productName: 'Pho Mai Bò Cười',
      categoryID: 2,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 50000,
      like: 100,
      describe: '',
      promotionalPrice: 36000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2Fphomai.jpg?alt=media&token=985a512e-5a8c-484e-8d59-ac74f68316fd'),
  ProductItem(
      rating: 4.2,
      isRating: true,
      quantity: 0,
      km: '2.2km',
      productID: 7,
      productName: 'Nước giải khát Sprite',
      categoryID: 6,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 12000,
      like: 100,
      describe: '',
      promotionalPrice: 7000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2Fsprite.jpg?alt=media&token=4a9be616-8423-421e-ba65-5f22657c986b'),
  ProductItem(
      rating: 3.9,
      isRating: false,
      quantity: 10,
      km: '2.7km',
      productID: 7,
      productName: 'Sữa Chưa Vinamilk',
      categoryID: 2,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 25000,
      like: 100,
      describe: '',
      promotionalPrice: 17000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2Fsuachuavinamilk.jpg?alt=media&token=24042a92-1fc4-4729-b878-50125bc88266'),
  ProductItem(
      rating: 4.4,
      isRating: true,
      quantity: 8,
      km: '2.5km',
      productID: 7,
      productName: 'Sữa Ông Thọ',
      categoryID: 2,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 24000,
      like: 100,
      describe: '',
      promotionalPrice: 17000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2Fsuaongtho.jpg?alt=media&token=f26a635c-1c93-493b-8c20-564692f5dbfb'),
  ProductItem(
      rating: 4.2,
      isRating: false,
      quantity: 0,
      km: '2.0km',
      productID: 7,
      productName: 'Sữa Tươi 100%',
      categoryID: 2,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 20000,
      like: 100,
      describe: '',
      promotionalPrice: 14000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2Fsuatuoi.jpg?alt=media&token=6a52f0f1-a3bb-4f47-9811-ecda0c3f1369'),
  ProductItem(
      rating: 3.4,
      isRating: true,
      quantity: 27,
      km: '2.6km',
      productID: 7,
      productName: 'Thịt hộp',
      categoryID: 7,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 55000,
      like: 100,
      describe: '',
      promotionalPrice: 36000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2Fthithop.jpg?alt=media&token=b199f498-ed89-4eb1-a665-393aca8eb88f'),
  ProductItem(
      rating: 3.5,
      isRating: true,
      quantity: 0,
      km: '2.7km',
      productID: 7,
      productName: 'Yến Mạch',
      categoryID: 5,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 100000,
      like: 100,
      describe: '',
      promotionalPrice: 67000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2Fyenmach.jpg?alt=media&token=c684c595-ce90-47de-831f-86389d879a94'),
  ProductItem(
      rating: 4.0,
      isRating: false,
      quantity: 33,
      km: '3km',
      productID: 7,
      productName: 'Bánh đậu xanh',
      categoryID: 5,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 100000,
      like: 100,
      describe: '',
      color: Colors.black,
      promotionalPrice: 67000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2Fbanhdauxanh.jpg?alt=media&token=9dbd5620-d8f1-4b4d-bad4-02bb348b3aad'),
  ProductItem(
      rating: 3.7,
      isRating: true,
      quantity: 7,
      km: '2.5km',
      productID: 7,
      productName: 'Trà xanh cozy',
      categoryID: 5,
      storeID: "3HwkLw9H5rUp99tkSSW1",
      price: 100000,
      like: 100,
      describe: '',
      color: Colors.green,
      promotionalPrice: 67000,
      expirationDate: DateTime.now(),
      image:
          'https://firebasestorage.googleapis.com/v0/b/prm-shopping.appspot.com/o/product%2Ftraxanh.jpg?alt=media&token=e407c30f-edc5-4358-8255-fec844459a8f'),
];
