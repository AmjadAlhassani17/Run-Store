import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:runstore/featcher/model/user_model.dart';
import 'package:runstore/utils/shared/local_user_data.dart';

class DataUser extends GetxController{

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get Loading => _loading;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  static LocalStorageData localStorageData =
      Get.put(LocalStorageData(), permanent: true);

  UserModel _userModel = Get.put(UserModel());
  UserModel get userModel => _userModel;


  void getCurrentUser() async{
    _loading.value = true;
    await localStorageData.getUser.then((value){
      _userModel = value as UserModel;
    });
    _loading.value = false;
    update();
  }

  Future<void> signOut() async{
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }
}