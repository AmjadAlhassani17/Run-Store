import 'package:get/get.dart';

class DetailsSizeItemViewModel extends GetxController{
  
  int size = 1;
  void changeSize({required int lenght}) {
    size = lenght;
    update();
  }

  bool customTileExpanded = false;
  void changeStateExpanded(bool select) {
    customTileExpanded = select;
    update();
  }

  bool customTileExpanded2 = false;
  void changeStateExpanded2(bool select) {
    customTileExpanded2 = select;
    update();
  }
}