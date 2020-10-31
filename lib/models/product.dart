import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductItem {
  int productID;
  String productName;
  double price;
  int promotionalPrice;
  int like;
  int storeID;
  int categoryID;
  String describe;
  String image;
  DateTime createDate;
  DateTime expirationDate;
  Color color = Colors.white;
  DocumentReference _reference;
  int _quantityInCart = 0;


  int get quantityInCart => _quantityInCart;

  set quantityInCart(int value) {
    _quantityInCart = value;
  }

  ProductItem.Internal(
      this.productID,
      this.productName,
      this.price,
      this.promotionalPrice,
      this.like,
      this.storeID,
      this.categoryID,
      this.describe,
      this.image,
      this.createDate,
      this.expirationDate,
      this.color,);

  DocumentReference get reference => _reference;

  set reference(DocumentReference value) {
    _reference = value;
  }

  ProductItem({
    this.productID,
    this.productName,
    this.price,
    this.promotionalPrice,
    this.like,
    this.storeID,
    this.categoryID,
    this.describe,
    this.image,
    this.createDate,
    this.expirationDate,
    this.color,
  });

  Map<String, dynamic> toJson() => _ProductToJson(this);
  ProductItem ProductFromJson(Map<String, dynamic> json)
  {
    print("Jsoning product from query");
    return ProductItem.Internal(
      json['productID'] as int,
      json['productName'] as String,
      json['price'] as double,
      json['promotionalPrice'] as int,
      json['like'] as int,
      json['storeID'] as int,
      json['categoryID'] as int,
      json['describe'] as String,
      json['image'] as String,
      json['createDate'] as DateTime,
      json['expirationDate'] as DateTime,
      null
    );
  }

}



Map<String, dynamic> _ProductToJson(ProductItem instance) => <String, dynamic> {
  'productID': instance.productID,
  'productName': instance.productName,
  'price': instance.price,
  'promotionalPrice': instance.promotionalPrice,
  'like': instance.like,
  'storeID': instance.storeID,
  'categoryID': instance.categoryID,
  'describe': instance.describe,
  'image': instance.image,
  'createDate': instance.createDate,
  'expirationDate': instance.expirationDate,
  'color':  instance.color != null ? instance.color.value : null,
};
