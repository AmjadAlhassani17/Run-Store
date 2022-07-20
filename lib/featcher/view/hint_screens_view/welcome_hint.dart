import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:runstore/utils/locale/language_all.dart';
import '../../core/colors/colors.dart';
import '../../core/path/svgs_path.dart';
import '../widgets/custom_text.dart';
import 'package:get/get.dart';

class WelcomeHint extends StatelessWidget {
  WelcomeHint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 600,
        width: double.infinity,
        color: ColorSelect.scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 90,
            ),
            Container(
              decoration: ShapeDecoration(
                  shadows: [
                    BoxShadow(
                      color: ColorSelect.blackColor.withOpacity(0.04),
                      spreadRadius: 0,
                      blurRadius: 30,
                      offset: const Offset(0, 1),
                    )
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200.0),
                  )),
              child: SvgPicture.asset(
                SvgsPath.logo,
                width: 124,
                height: 124,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CustomText(
              text: StringKey.welcome.tr,
              color: ColorSelect.textColor,
              fontsize: 34,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.normal,
              textOverflow: TextOverflow.clip,
              height: 0.0,
            ),
            SizedBox(
              height: 30,
            ),
            SvgPicture.asset(
              SvgsPath.icon1,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: CustomText(
                text:
                    StringKey.hint1.tr,
                color: ColorSelect.discriptiontextColor,
                fontsize: 17,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.normal,
                textOverflow: TextOverflow.clip,
                height: 0.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
