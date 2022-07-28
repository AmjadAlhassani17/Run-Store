import 'package:get/get.dart';

class CheckOutViewModel extends GetxController{
  int state = 0;
  void changeStateCheckOut({required int index}) {
    state = index;
    update();
  }


  int statePrice = 1;
  void changeStatePrice({required int index}) {
    statePrice = index;
    update();
  }
}