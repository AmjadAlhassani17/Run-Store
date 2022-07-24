// ignore_for_file: unused_label, unnecessary_null_comparison

import '../../utils/constants.dart';

class CartProduct {
  int? id;
  String? title;
  dynamic price;
  String? description;
  String? image;

  CartProduct(
      {required this.image,
      required this.title,
      required this.price,
      required this.description,
      required this.id});

  CartProduct.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) {
      return;
    }
    id:
    json[Constant.id];
    title:
    json[Constant.title];
    price:
    json[Constant.price];
    description:
    json[Constant.description];
    image:
    json[Constant.image];
  }

  toJson() {
    return {
      Constant.image: image,
      Constant.title: title,
      Constant.price: price,
      Constant.description: description,
      Constant.id: id,
    };
  }
}
