// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int id;
  String productName;
  String category;
  int price;
  bool isPopular;
  bool isNew;
  DateTime createdAt;
  DateTime updatedAt;
  String coverImage;

  ProductModel({
    required this.id,
    required this.productName,
    required this.category,
    required this.price,
    required this.isPopular,
    required this.isNew,
    required this.createdAt,
    required this.updatedAt,
    required this.coverImage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        productName: json["product_name"],
        category: json["category"],
        price: json["price"],
        isPopular: json["is_popular"],
        isNew: json["is_new"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        coverImage: json["cover_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "category": category,
        "price": price,
        "is_popular": isPopular,
        "is_new": isNew,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "cover_image": coverImage,
      };
}
