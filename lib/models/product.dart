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
  Color color;
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


}

ProductItem ProductFromJson(Map<String, dynamic> json)
{
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
    json['color'] as Color,
  );
}