class CategoryProduct {
  int categoryID;
  String categoryName;
  String urlImage;
  CategoryProduct({
    this.categoryID,
    this.categoryName,
    this.urlImage,
  });

  CategoryProduct.Internal(
      this.categoryID,
      this.categoryName,
      this.urlImage,
      );

  Map<String, dynamic> toJson() => _CategoryProduct(this);

  CategoryProduct CategoryFromJson(Map<String, dynamic> json)
  {
    return CategoryProduct.Internal(
      json['categoryID'] as int,
      json['categoryName'] as String,
      json['urlImage'] as String,
    );
  }
}



Map<String, dynamic> _CategoryProduct(CategoryProduct instance) => <String, dynamic> {
  'categoryID': instance.categoryID,
  'categoryName': instance.categoryName,
  'urlImage': instance.urlImage,
};
