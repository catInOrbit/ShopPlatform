import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
  String km;
  int quantity;
  double rating;
  bool isRating;
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
      this.color,
      this.km,
      this.quantity,
      this.rating,
      this.isRating);

  DocumentReference get reference => _reference;

  set reference(DocumentReference value) {
    _reference = value;
  }

  ProductItem(
      {this.productID,
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
      this.km,
      this.quantity,
      this.rating,
      this.isRating});

  Map<String, dynamic> toJson() => _ProductToJson(this);
  ProductItem ProductFromJson(Map<String, dynamic> json) {
    print("Jsoning product from query");

    var product =
     ProductItem.Internal(
      json['productID'] as int,
      json['productName'] as String,
      json['price'] as double,
      json['promotionalPrice'] as int,
      json['like'] as int,
      json['storeID'] as int,
      json['categoryID'] as int,
      json['describe'] as String,
      json['image'] as String,
      new DateTime.now(),
      new DateTime.now(),
      // ((json['expirationDate'] as Timestamp)).toDate(),
      // ((json['expirationDate'] as Timestamp)).toDate(),
      Colors.green,
      json['km'] as String,
      json['quantity'] as int,
      json['rating'] as double,
      json['isRating'] as bool,
    );

    return product;
  }
}

Map<String, dynamic> _ProductToJson(ProductItem instance) => <String, dynamic>{
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
      'color': instance.color != null
          ? instance.color.toString()
          : null, //Output of hex color: 0xff4caf50
      "km": instance.km,
      "quantity": instance.quantity,
      "rating": instance.rating,
      "isRating": instance.isRating
    };

Color getColorFromHex(String hexString) {}
