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
  });
}