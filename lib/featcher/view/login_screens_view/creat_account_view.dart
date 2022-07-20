import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/core/path/images_path.dart';
import 'package:runstore/featcher/view/login_screens_view/new_account_view.dart';
import 'package:runstore/featcher/view/login_screens_view/signin_account_view.dart';
import 'package:runstore/featcher/view/widgets/custom_button.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import 'package:runstore/utils/locale/language_all.dart';
import '../../core/path/svgs_path.dart';
import 'package:get/get.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5665,
              width: double.infinity,
              child: Image.asset(ImagesPath.createImage, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: (MediaQuery.of(context).size.height * 0.4785) + 62,
              color: ColorSelect.transparent,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4785,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(38),
                            topRight: Radius.circular(38),
                          ),
                          color: ColorSelect.whiteColor,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 60, right: 60),
                                child: CustomText(
                                  text: StringKey.craeteAccount.tr,
                                  color: ColorSelect.textColor,
                                  fontsize: 32,
                                  textAlign: TextAlign.start,
                                  fontWeight: FontWeight.w600,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 60, right: 60),
                                child: CustomText(
                                  text: StringKey.craeteAccountdisc.tr,
                                  color: ColorSelect.discriptiontextColor,
                                  fontsize: 17,
                                  textAlign: TextAlign.start,
                                  fontWeight: FontWeight.w200,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomBotton(
                                    text: StringKey.signup.tr,
                                    width: 140,
                                    height: 50,
                                    fontWeight: FontWeight.w600,
                                    function: () =>
                                        Get.offAll(() => NewAccount()),
                                    color: ColorSelect.primarycolor,
                                    backgroundcolor: ColorSelect.whiteColor,
                                    textAlign: TextAlign.center,
                                    fontsize: 17,
                                  ),
                                  CustomBotton(
                                    text: StringKey.signin.tr,
                                    width: 140,
                                    height: 50,
                                    fontWeight: FontWeight.w600,
                                    function: () =>
                                        Get.offAll(() => SignInAccount()),
                                    color: ColorSelect.whiteColor,
                                    backgroundcolor: ColorSelect.primarycolor,
                                    textAlign: TextAlign.center,
                                    fontsize: 17,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: (MediaQuery.of(context).size.width * 0.4785) + 42,
                    right: 0,
                    child: SvgPicture.asset(
                      SvgsPath.logo,
                      width: 124,
                      height: 124,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
