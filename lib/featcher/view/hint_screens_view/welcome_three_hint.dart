import 'package:flutter/material.dart';
import 'package:runstore/featcher/core/path/images_path.dart';
import 'package:runstore/featcher/view/widgets/custom_newest.dart';
import 'package:runstore/utils/locale/language_all.dart';
import '../../core/colors/colors.dart';
import '../widgets/custom_text.dart';
import 'package:get/get.dart';

class WelcomeHint3 extends StatelessWidget {
  WelcomeHint3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 650,
        width: double.infinity,
        color: ColorSelect.scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 90,
            ),
            CustomNewest(
              text: StringKey.hint3Top.tr,
              width: 80,
              height: 36,
              fontWeight: FontWeight.w600,
              color: ColorSelect.whiteColor,
              backgroundcolor: ColorSelect.footwear,
              textAlign: TextAlign.center,
              fontsize: 14,
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              ImagesPath.icon3,
              height: 250,
              width: 250,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Column(
                children: [
                  CustomText(
                    text:
                        StringKey.hint3Name.tr,
                    color: ColorSelect.discriptiontextColor,
                    fontsize: 34,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    textOverflow: TextOverflow.clip,
                    height: 0.0,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomText(
                    text:
                        StringKey.hint3.tr,
                    color: ColorSelect.discriptiontextColor,
                    fontsize: 17,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.normal,
                    textOverflow: TextOverflow.clip,
                    height: 0.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
