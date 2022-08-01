// ignore_for_file: unused_element
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../storage/database_helper_shopping.dart';
import '../model/cart_product_model.dart';

class ShoppingViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  List<CartProduct> cart = [];
  double totalPrice = 0.0;
  // double get totalPrice => _totalPrice;

  // on Inite =>
  ShoppingViewModel() {
    getAllProduct();
  }
  static var db = ShoppingDatabase.instance;
  getAllProduct() async {
    cart.clear();
    _loading.value = true;
    cart = await db.getAllProduct();
    _loading.value = false;
    getTotalPrice();
    print("MSG_FAV_LENGTH getAllProduct ${cart.length}");
    update();
  }


  deleteProduct(int id) async {
    for (int i = 0; i < cart.length; i++) {
      (cart[i].id == id) ;
        totalPrice -= (double.parse(cart[i].price.toString()));
      }
    await db.delete2(id);
    await db.delete(id);
    getAllProduct();
    update();
  }

  Future<bool> getProduct(int id) async {   
    return  db.getProductId(id);
  }

  getTotalPrice() {
    for (int i = 0; i < cart.length; i++) {
      totalPrice += (double.parse(cart[i].price.toString()));
    }
    update();
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


    
  }
}
