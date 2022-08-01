
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../shared/shared_preferance.dart';

class MyLocaleController extends GetxController{
  Locale? intiallanguage = Locale(SharedPrefs.instance.getLangState()!); 
  void changeLanguage(String codeLanguage){
    Locale currentLanguage = Locale(codeLanguage);
    SharedPrefs.instance.setLangState(codeLanguage);
    Get.updateLocale(currentLanguage);
  }

}