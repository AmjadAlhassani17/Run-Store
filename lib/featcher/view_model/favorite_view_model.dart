import 'package:get/get.dart';

class FavoriteViewModel extends GetxController {

  bool favoriteSelect = true;
  void changeColorfavoriteSelect(bool select) {
    favoriteSelect = select;
    update();
  }

}
