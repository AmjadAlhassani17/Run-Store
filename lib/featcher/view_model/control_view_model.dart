import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/app_screens_view/details_view.dart';
import '../view/app_screens_view/favorite_view.dart';
import '../view/app_screens_view/home_view.dart';
import '../view/app_screens_view/profile_view.dart';
import '../view/app_screens_view/shopping_view.dart';

class ControlViewModel extends GetxController{
  int _navigatorValue = 0;
  Widget _currentScreen = const HomeView();
  get navigator => _navigatorValue;
  get currentScrren => _currentScreen;
  void ChangeNavigatorValue(int Selector) {
    _navigatorValue = Selector;
    switch (Selector) {
      case 0:
        {
          _currentScreen = const HomeView();
          break;
        }
      case 1:
        {
          _currentScreen =   const DetailsView();
          break;
        }
      case 2:
        {
          _currentScreen = const ShoppingView();
          break;
        }
      case 3:
        {
          _currentScreen =  FavoriteView();
          break;
        }
      case 4:
        {
          _currentScreen = const ProfileView();
          break;
        }
    }
    update();
  }
}