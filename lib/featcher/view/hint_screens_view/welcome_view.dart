// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/core/path/images_path.dart';
import 'package:runstore/featcher/core/path/svgs_path.dart';
import 'package:runstore/featcher/view/hint_screens_view/hint_view.dart';
import 'package:runstore/featcher/view/widgets/custom_button.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import '../../../utils/locale/language_all.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagesPath.background), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                decoration: ShapeDecoration(
                    shadows: [
                      BoxShadow(
                        color: ColorSelect.blackColor.withOpacity(0.04),
                        spreadRadius: 0,
                        blurRadius: 15,
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
                height: 30,
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
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: CustomText(
                  text:
                      StringKey.discWelcome.tr,
                  color: ColorSelect.discriptiontextColor,
                  fontsize: 17,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.normal,
                  textOverflow: TextOverflow.clip,
                  height: 0.0,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              CustomBotton(
                text: StringKey.start.tr,
                width: 215,
                height: 50,
                fontWeight: FontWeight.w600,
                function: () {
                  Get.offAll(() => HintView());
                },
                color: ColorSelect.whiteColor,
                backgroundcolor: ColorSelect.primarycolor,
                textAlign: TextAlign.center,
                fontsize: 17,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: MediaQuery.of(context).size.height * 1.9 / 100,
                child: CustomText(
                  text: StringKey.version,
                  color: ColorSelect.primarycolor,
                  fontsize: 14,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                  textOverflow: TextOverflow.clip,
                  height: 0.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
