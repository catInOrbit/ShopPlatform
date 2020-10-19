import 'package:ExpShop/model/categoryProduct.dart';
import 'package:ExpShop/model/product.dart';
import 'package:ExpShop/model/store.dart';

var listStore = [
  Store(
      storeID: 1,
      storeName: 'Shop A',
      address: 'Quan 1 HCM',
      describe: 'SHop hoatj dong voi 5 nam kinh nghiem',
      longitude: 0000,
      latitude: 0000,
      phoneNumber: "0123456789"),
  Store(
      storeID: 2,
      storeName: 'Shop A',
      address: 'Quan 1 HCM',
      describe: 'SHop hoatj dong voi 5 nam kinh nghiem',
      longitude: 0000,
      latitude: 0000,
      phoneNumber: "0123456789"),
];

var listCagory = [
  CategoryProduct(categoryID: 1, categoryName: "Dong hop"),
  CategoryProduct(categoryID: 2, categoryName: "Thuc an"),
  CategoryProduct(categoryID: 3, categoryName: "Nuoc uong"),
];

var listProduct = [
  ProductItem(
      productID: 1,
      productName: 'Cafe',
      categoryID: 3,
      storeID: 2,
      price: 10000,
      like: 100,
      describe: 'ca phe chat luong cao ',
      promotionalPrice: 8000,
      image: 'https://cf.shopee.vn/file/fe17c960e9f8c48134dd077befcb66e4'),
  ProductItem(
      productID: 2,
      productName: 'Cafe1',
      categoryID: 3,
      storeID: 2,
      price: 10000,
      like: 100,
      describe: 'ca phe chat luong cao ',
      promotionalPrice: 8000,
      image: 'https://cf.shopee.vn/file/fe17c960e9f8c48134dd077befcb66e4'),
  ProductItem(
      productID: 3,
      productName: 'Cafe2',
      categoryID: 3,
      storeID: 2,
      price: 10000,
      like: 100,
      describe: 'ca phe chat luong cao ',
      promotionalPrice: 8000,
      image: 'https://cf.shopee.vn/file/fe17c960e9f8c48134dd077befcb66e4'),
  ProductItem(
      productID: 4,
      productName: 'Cafe3',
      categoryID: 3,
      storeID: 2,
      price: 10000,
      like: 100,
      describe: 'ca phe chat luong cao ',
      promotionalPrice: 8000,
      image: 'https://cf.shopee.vn/file/fe17c960e9f8c48134dd077befcb66e4'),
  ProductItem(
      productID: 5,
      productName: 'Cafe4',
      categoryID: 3,
      storeID: 2,
      price: 10000,
      like: 100,
      describe: 'ca phe chat luong cao ',
      promotionalPrice: 8000,
      image: 'https://cf.shopee.vn/file/fe17c960e9f8c48134dd077befcb66e4'),
  ProductItem(
      productID: 6,
      productName: 'Cafe5',
      categoryID: 3,
      storeID: 2,
      price: 10000,
      like: 100,
      describe: 'ca phe chat luong cao ',
      promotionalPrice: 8000,
      image: 'https://cf.shopee.vn/file/fe17c960e9f8c48134dd077befcb66e4'),
  ProductItem(
      productID: 7,
      productName: 'Cafe6',
      categoryID: 3,
      storeID: 2,
      price: 10000,
      like: 100,
      describe: 'ca phe chat luong cao ',
      promotionalPrice: 8000,
      image: 'https://cf.shopee.vn/file/fe17c960e9f8c48134dd077befcb66e4'),
];
