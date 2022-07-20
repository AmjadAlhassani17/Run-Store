// ignore_for_file: unused_field

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _preferences;

  //static String logInSave = "logInSave";
  static String lang = "lang";

  static SharedPrefs? _instanse;
  SharedPrefs._();
  static SharedPrefs get instance => _instanse ??= SharedPrefs._();

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  // void setLoginState() {
  //   _preferences?.setInt(logInSave, 1);
  // }

  // int getLoginState() {
  //   return _preferences?.getInt(logInSave) ?? 0;
  // }

  void setLangState(String code) {
    _preferences?.setString(lang, code);
  }

  String? getLangState() {
    return _preferences?.getString(lang) ?? "en";
  }

}
