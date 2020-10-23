import 'dart:ffi';

class Product{
  String image;
  String name;
  String description;
  int quantity;
  double price;
  String id;

  Product(this.id, this.image, this.name, this.description, this.price, this.quantity);

  Map<String, dynamic> toJson() =>
  {
    "id" : id,
    "name" : name,
    "image" : image,
    "description" : description,
    "quantity" : quantity,
    "price" : price
  };

  Product ProductFromJson(Map<String, dynamic> json)
  {
    return Product(
      json['id'] as String,
      json['image'] as String,
      json['name'] as String,
      json['description'] as String,
      json['price'] as double,
      json['quantity'] as int,
    );
  }
}