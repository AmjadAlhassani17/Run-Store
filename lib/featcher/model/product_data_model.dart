import 'dart:convert';

import 'package:runstore/featcher/model/category_model.dart';

ProductData productFromJson(String str) =>
    ProductData.fromJson(json.decode(str));

String productToJson(ProductData data) => json.encode(data.toJson());

class ProductData {
  ProductData({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.categoryId,
  });

  int id;
  String title;
  dynamic price;
  String description;
  Category category;
  List<String> images;
  int categoryId;

  @override
  bool operator ==(Object others) =>
      identical(this, others) || others is ProductData && title == others.title;

  @override
  int get hashCode => title.hashCode;

  factory ProductData.fromJson(Map<dynamic, dynamic> json) => ProductData(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: Category.fromJson(json["category"]),
        images: List<String>.from(json["images"].map((x) => x)),
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "categoryId": categoryId,
      };
}
