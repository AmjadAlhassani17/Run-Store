import 'package:flutter/material.dart';
import 'package:runstore/featcher/core/colors/colors.dart';

class TheamData {
  static TheamData? _instanse;
  TheamData._();
  static TheamData get instance => _instanse ??= TheamData._();

  ThemeData get materialTheme {
    return ThemeData(
      primaryColor: ColorSelect.primarycolor,
      scaffoldBackgroundColor: ColorSelect.whiteColor,
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: Colors.transparent,
      ),
      brightness: Brightness.dark,
      fontFamily: 'NunitoSans',
    );
  }
}
