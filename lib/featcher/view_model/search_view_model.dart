import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/view/app_screens_view/search_sup_category_view/all_product_search.dart';

import '../view/app_screens_view/search_sup_category_view/kid_search.dart';
import '../view/app_screens_view/search_sup_category_view/man_search.dart';
import '../view/app_screens_view/search_sup_category_view/women_search.dart';

class SearchViewModel extends GetxController {
  TextEditingController search = TextEditingController();

  void onChangeSearch() {
    AllProductSearchView.display_list = AllProductSearchView.dioMethods.products
        .where((element) =>
            element.title.toLowerCase().contains(search.text.toLowerCase())).toSet();
    update();
  }

  void onChangeSearchMan() {
    ManSearch.display_list = ManSearch.dioMethods.man
        .where((element) =>
            element.title.toLowerCase().contains(search.text.toLowerCase())).toSet();
    update();
  }

  void onChangeSearchWomen() {
    WomenSearch.display_list = WomenSearch.dioMethods.women
        .where((element) =>
            element.title.toLowerCase().contains(search.text.toLowerCase())).toSet();
    update();
  }

  void onChangeSearchKid() {
    KidSearch.display_list = KidSearch.dioMethods.kid
        .where((element) =>
            element.title.toLowerCase().contains(search.text.toLowerCase())).toSet();
    update();
  }
  
}
