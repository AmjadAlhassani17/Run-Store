import 'dart:io';

abstract class Constant{
  static int pageSelect = -1;
  static String? password;
  static File? imagePath;
  static String CHATCH_USER_DATA = 'userId';
  static String baseUrl = 'https://api.escuelajs.co/api/v1/';
  static int itemCount = 6;
  static int indexItem = 0;
  static int indexItem2 = 5;

  static String tableProduct = 'cartProduct';
  static String id = 'id';
  static String title = 'title';
  static String price = 'price';
  static String description = 'description';
  static String image = 'image';
  static var fav = "Fav";
  
  static String tableProductShop = 'shoppingProduct';
  static String idShop = 'id';
  static String titleShop = 'title';
  static String priceShop = 'price';
  static String descriptionShop = 'description';
  static String imageShop = 'image';
  static var favShop = "Fav";

  static int? lastNotificationId;
}