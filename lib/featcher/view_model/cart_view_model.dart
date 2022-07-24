// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../storage/database_helper.dart';
import '../model/cart_product_model.dart';


class CartViewModel extends GetxController {
  // ignore: prefer_final_fields
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  List<CartProduct> cart = [];

  // double _totalPrice = 0.0;
  // double get totalPrice => _totalPrice;

  // on Inite =>
  CartViewModel() {
    getAllProduct();
  }
  static var db = CartDatabase.instance;

  getAllProduct() async {
    cart.clear();
    _loading.value = true;
    cart = await db.getAllProduct();
    _loading.value = false;
    print("MSG_FAV_LENGTH getAllProduct ${cart.length}");
    update();
  }


  deleteProduct(int id) async {
    await db.delete2(id);
    await db.delete(id);
    getAllProduct();
    update();
  }

  Future<bool> getProduct(int id) async {   
    return  db.getProductId(id);
  }

  addProduct(CartProduct cartProduct) async {
    if (cart.isEmpty) {
      await db.create(cartProduct , isFromFav: true);
      cart.add(cartProduct);
      getAllProduct();
      update();
    } else {
      for (int i = 0; i < cart.length; i++) {
        if (cartProduct.id == cart[i].id) {
          return;
        }
      }
      await db.create(cartProduct , isFromFav: true);
      cart.add(cartProduct);
      getAllProduct();
      update();
    }

    // Future<CartProduct?> getProductId(int productId) async {
    //   var db = await database;
    //   List<Map<String, dynamic>> maps = await db?.query(Constant.tableProduct,
    //       where: '${Constant.id} = ?', whereArgs: [productId]);
    //   print(maps.toList());
    //   CartProduct.fromJson(maps.first);
    // }

    // getTotalPrice() {
    //   for (int i = 0; i < cart.length; i++) {
    //     _totalPrice +=
    //         (double.parse(cart[i].price.toString()) );
    //   }
    //   update();
    // }
  }
}
