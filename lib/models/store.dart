import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Store {
  Color shopColor;
  int storeID;
  String storeName;
  String address;
  double longitude;
  double latitude;
  String phoneNumber;
  String description;
  String urlImage;
  DocumentReference _documentReference;

  DocumentReference get documentReference => _documentReference;

  set documentReference(DocumentReference value) {
    _documentReference = value;
  }

  Store({
    this.storeID,
    this.storeName,
    this.address,
    this.longitude,
    this.latitude,
    this.phoneNumber,
    this.description,
    this.urlImage,
    this.shopColor,
  });

  Store.Internal(
      this.shopColor,
      this.storeID,
      this.storeName,
      this.address,
      this.longitude,
      this.latitude,
      this.phoneNumber,
      this.description,
      this.urlImage,
      );

  Map<String, dynamic> toJson() => _StoretToJson(this);
  Store StoreFromJson(Map<String, dynamic> json)
  {
    print("Jsoning store from query");
    return Store.Internal(
      // Color(json['shopColor'] as String) ,
      Colors.blue,
      json['storeID'] as int,
      json['storeName'] as String,
      json['address'] as String,
      json['longitude'] as double,
      json['latitude'] as double,
      json['phoneNumber'] as String,
      json['description'] as String,
      json['urlImage'] as String,
    );
  }

  Map<String, dynamic> _StoretToJson(Store instance) => <String, dynamic> {
    'shopColor' : instance.shopColor.toString(),
    'storeID' : instance.storeID,
    "storeName" : instance.storeName,
    'address' : instance.address,
    'longitude' : instance.longitude,
    'latitude' : instance.latitude,
    'phoneNumber' : instance.phoneNumber,
    'description' : instance.description,
    'urlImage' : instance.urlImage,
  };
}
