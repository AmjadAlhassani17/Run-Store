import 'dart:async';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:runstore/featcher/core/theme/my_app.dart';
import 'package:runstore/utils/shared/shared_preferance.dart';
import 'featcher/core/colors/colors.dart';
import 'network/dio_manage_class.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    DioManagerClass.getInstance.init();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorSelect.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    await SharedPrefs.init();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    runApp(const AppWidget());
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

String prettyPrint(Map json) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}
