import 'dart:convert';
import 'package:get/get.dart';
import 'package:runstore/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../featcher/model/user_model.dart';

class LocalStorageData extends GetxController {

  Future<UserModel?> get getUser async{
    try{
      UserModel userModel = await _getUserData();
      // ignore: unnecessary_null_comparison
      if(userModel == null){
        return null;
      }
      return userModel;
    }
    catch(e){
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }
  
  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(Constant.CHATCH_USER_DATA);
    return UserModel.fromJson(json.decode(value as String));
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Constant.CHATCH_USER_DATA, json.encode(userModel.toJson()));
  }

  void deletUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
