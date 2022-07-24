import 'package:get/get.dart';
import 'package:runstore/network/dio_manage_class.dart';
import 'package:dio/dio.dart' as dio;

import '../model/product_data_model.dart';

class DioMethods extends GetxController {
  Set<ProductData> products = {};
  Set<ProductData> shoes = {};
  Set<ProductData> clothes = {};
  Set<ProductData> furniture = {};
  Set<ProductData> electronics = {};
  Set<ProductData> others = {};
  Set<ProductData> man = {};
  Set<ProductData> women = {};
  Set<ProductData> kid = {};
  Set<ProductData> supman = {};
  Set<ProductData> supwomen = {};
  Set<ProductData> supkid = {};

  void getData() async {
    dio.Response<dynamic> res =
        await DioManagerClass.getInstance.dioGetMethod(url: 'products');
    if (res.statusCode == 200) {
      List data = res.data;
      Set<ProductData> productsList =
          data.map((e) => ProductData.fromJson(e)).toSet();

      products = productsList;
      if (!productsList.isEmpty) {
        for (int i = 0; i < products.length; i++) {
          if (products.elementAt(i).category.name == "Shoes" && products.elementAt(i).id != 2) {
            shoes.add(products.elementAt(i));
          } else if (products.elementAt(i).category.name == "Clothes" && products.elementAt(i).price != 100 && products.elementAt(i).price != 999) {
            clothes.add(products.elementAt(i));
          } else if (products.elementAt(i).category.name == "Furniture") {
            furniture.add(products.elementAt(i));
          } else if (products.elementAt(i).category.name == "Electronics") {
            electronics.add(products.elementAt(i));
          } else if (products.elementAt(i).category.name == "Others") {
            others.add(products.elementAt(i));
          }
        }
      }
      int num1= 0;
      int num2= 0;
      int num3= 0;
      int num4= 0;
      int num5= 0;
      if (!productsList.isEmpty) {
        for (int i = 0; i < products.length; i++) {
          if (products.elementAt(i).category.name == "Shoes" && products.elementAt(i).id != 2 && num1 < 15) {
            if(num1 < 5){
              man.add(products.elementAt(i));
              supman.add(products.elementAt(i));
              num1++;
            }else if (num1 >= 5 && num1 < 10){
              women.add(products.elementAt(i));
              supwomen.add(products.elementAt(i));
              num1++;
            }else{
              kid.add(products.elementAt(i));
              supkid.add(products.elementAt(i));
              num1++;
            }
          } else if (products.elementAt(i).category.name == "Clothes" && products.elementAt(i).price != 100 && products.elementAt(i).price != 999 && num2 < 15) {
            if(num2 < 5){
              man.add(products.elementAt(i));
              supman.add(products.elementAt(i));
              num2++;
            }else if (num2 >= 5 && num2 < 10){
              women.add(products.elementAt(i));
              supwomen.add(products.elementAt(i));
              num2++;
            }else{
              kid.add(products.elementAt(i));
              supkid.add(products.elementAt(i));
              num2++;
            }
          } else if (products.elementAt(i).category.name == "Furniture" && num3 < 15) {
            if(num3 < 5){
              man.add(products.elementAt(i));
              supman.add(products.elementAt(i));
              num3++;
            }else if (num3 >= 5 && num3 < 10){
              women.add(products.elementAt(i));
              supwomen.add(products.elementAt(i));
              num3++;
            }else{
              kid.add(products.elementAt(i));
              supkid.add(products.elementAt(i));
              num3++;
            }
          } else if (products.elementAt(i).category.name == "Electronics" && num4 < 15) {
            if(num4 < 5){
              man.add(products.elementAt(i));
              supman.add(products.elementAt(i));
              num4++;
            }else if (num4 >= 5 && num4 < 10){
              women.add(products.elementAt(i));
              supwomen.add(products.elementAt(i));
              num4++;
            }else{
              kid.add(products.elementAt(i));
              supkid.add(products.elementAt(i));
              num4++;
            }
          } else if (products.elementAt(i).category.name == "Others" && num5 < 15) {
            if(num5 < 5){
              man.add(products.elementAt(i));
              supman.add(products.elementAt(i));
              num5++;
            }else if (num5 >= 5 && num5 < 10){
              women.add(products.elementAt(i));
              supwomen.add(products.elementAt(i));
              num5++;
            }else{
              kid.add(products.elementAt(i));
              supkid.add(products.elementAt(i));
              num5++;
            }
          }
        }
      }

    }
    update();
  }


}
