// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/view/login_screens_view/forget_password_view/verification_code_view.dart';
import 'package:runstore/featcher/view/login_screens_view/signin_account_view.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import 'package:runstore/utils/locale/language_all.dart';
import 'package:get/get.dart';
import '../../../core/path/svgs_path.dart';
import '../../widgets/custom_button.dart';

class NewPassword extends StatelessWidget {
  NewPassword({Key? key}) : super(key: key);
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.iconPerson,
      body: Stack(
        children: [
          Positioned(
            top: -20,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2167,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.offAll(() => VerificationCode()),
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: ColorSelect.whiteColor,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_sharp,
                          color: ColorSelect.blackColor,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: (MediaQuery.of(context).size.height * 0.7832) + 62,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.7832,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(38),
                          topRight: Radius.circular(38),
                        ),
                        color: ColorSelect.whiteColor,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            CustomText(
                              text: StringKey.reset_password.tr,
                              color: ColorSelect.textColor,
                              fontsize: 34,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w600,
                              textOverflow: TextOverflow.clip,
                              height: 0.0,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 40, right: 40),
                              child: CustomText(
                                text: StringKey.newPassword.tr,
                                color: ColorSelect.textColor,
                                fontsize: 17,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w600,
                                textOverflow: TextOverflow.clip,
                                height: 0.0,
                              ),
                            ),
                            const SizedBox(
                              height: 42,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: ColorSelect.iconPerson,
                                  ),
                                  child: Icon(
                                    Icons.lock_outline,
                                    color: ColorSelect.primarycolor,
                                    size: 35,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: StringKey.password.tr,
                                        color: ColorSelect.textColor,
                                        fontsize: 11,
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.w600,
                                        textOverflow: TextOverflow.clip,
                                        height: 0.0,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        height: 40,
                                        child: TextFormField(
                                          cursorColor: ColorSelect.textColor,
                                          controller: password,
                                          obscureText: true,
                                          validator: (value) {
                                            if (value.toString().length < 6 ||
                                                value!.isEmpty) {
                                              return StringKey
                                                  .correctPassword.tr;
                                            } else {
                                              return null;
                                            }
                                          },
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    ColorSelect.underlineText,
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    ColorSelect.underlineText,
                                              ),
                                            ),
                                          ),
                                          style: TextStyle(
                                            color: ColorSelect.primarycolor,
                                            fontSize: 16,
                                            decorationColor:
                                                ColorSelect.transparent,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: ColorSelect.iconPerson,
                                  ),
                                  child: Icon(
                                    Icons.lock_outline,
                                    color: ColorSelect.primarycolor,
                                    size: 35,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: 'Confirm Password',
                                        color: ColorSelect.textColor,
                                        fontsize: 11,
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.w600,
                                        textOverflow: TextOverflow.clip,
                                        height: 0.0,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        height: 40,
                                        child: TextFormField(
                                          cursorColor: ColorSelect.textColor,
                                          controller: passwordConfirm,
                                          obscureText: true,
                                          validator: (value) {
                                            if (value.toString().length < 6 || value!.isEmpty || value != password) {
                                              return StringKey
                                                  .correctPassword.tr;
                                            } else {
                                              return null;
                                            }
                                          },
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    ColorSelect.underlineText,
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    ColorSelect.underlineText,
                                              ),
                                            ),
                                          ),
                                          style: TextStyle(
                                            color: ColorSelect.primarycolor,
                                            fontSize: 16,
                                            decorationColor:
                                                ColorSelect.transparent,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: CustomBotton(
                                text: 'Reset password',
                                width: double.infinity,
                                height: 48,
                                fontWeight: FontWeight.w600,
                                function: () =>
                                    Get.offAll(() => SignInAccount()),
                                color: ColorSelect.whiteColor,
                                backgroundcolor: ColorSelect.primarycolor,
                                textAlign: TextAlign.center,
                                fontsize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
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
