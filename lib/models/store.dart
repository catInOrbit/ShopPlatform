import 'package:flutter/material.dart';

class Store {
  Color shopColors;
  int storeID;
  String storeName;
  String address;
  double longitude;
  double latitude;
  String phoneNumber;
  String describe;
  String urlImage;
  Store({
    this.storeID,
    this.storeName,
    this.address,
    this.longitude,
    this.latitude,
    this.phoneNumber,
    this.describe,
    this.urlImage,
    this.shopColors,
  });
}
