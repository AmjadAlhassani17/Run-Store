import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/theme/theam_data.dart';
import 'package:runstore/featcher/view/control.dart';
import '../../../utils/locale/locale.dart';
import '../../../utils/locale/locale_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyLocaleController viewModel = Get.put(MyLocaleController(), permanent: true);
    return GetMaterialApp(
      title: 'Run Store',
      debugShowCheckedModeBanner: false,
      theme: TheamData.instance.materialTheme,
      home:  ControlView(),
      smartManagement: SmartManagement.keepFactory,
      locale: viewModel.intiallanguage,
      translations: MyLocale(),
    );
  }
}
