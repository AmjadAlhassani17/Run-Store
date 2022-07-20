import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';
import '../core/colors/colors.dart';

class LoginViewModel extends GetxController {
  int state = Constant.pageSelect;
  Color colorSelect = ColorSelect.selectButtonColor;
  Color colorUnSelect = ColorSelect.unSelectButtonColor;
  Color? color;

  int passwordLenght = 0;

  void changePasswordLenght({required int lenght}) {
    passwordLenght = lenght;
    update();
  }

  void changeState(int select) {
    state = select;
    update();
  }
}
