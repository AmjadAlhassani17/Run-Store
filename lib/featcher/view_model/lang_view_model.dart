import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';

class LanguageViewModel extends GetxController{

  bool con = true;
  Color loopColor(int index , bool color) {
      if(index /2 % 2 == 1){
        return color == !con ?ColorSelect.primarycolor : ColorSelect.whiteColor ;
      }
      if(index % 2 != 1){
        return color == !con ?ColorSelect.whiteColor : ColorSelect.primarycolor ;
      }else {
        return color == !con ? ColorSelect.whiteColor : ColorSelect.whiteColor;
      }
  }
}