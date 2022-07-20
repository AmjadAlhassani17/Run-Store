// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/core/path/images_path.dart';
import 'package:runstore/featcher/view/login_screens_view/forget_password_view/reset_password.dart';
import 'package:runstore/featcher/view/login_screens_view/new_account_view.dart';
import 'package:runstore/featcher/view/widgets/custom_button.dart';
import 'package:runstore/featcher/view/widgets/custom_button_social.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import 'package:runstore/utils/locale/language_all.dart';
import 'package:get/get.dart';
import '../../core/path/svgs_path.dart';
import '../../view_model/auth_view_model.dart';

class SignInAccount extends StatelessWidget {
  SignInAccount({Key? key}) : super(key: key);

  static AuthViewModel authViewModel =
      Get.put(AuthViewModel(), permanent: true);

      IconData show = Icons.visibility_off_outlined;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4285,
                width: double.infinity,
                child: Image.asset(ImagesPath.signupImage, fit: BoxFit.cover),
              ),
              Positioned(
                top: 40,
                right: MediaQuery.of(context).size.width * 0.100,
                child: InkWell(
                  onTap: () => Get.offAll(() => NewAccount()),
                  child: CustomText(
                    text: StringKey.signup.tr,
                    color: ColorSelect.textColor,
                    fontsize: 17,
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.w600,
                    textOverflow: TextOverflow.clip,
                    height: 0.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: (MediaQuery.of(context).size.height * 0.6108) + 62,
            color: ColorSelect.transparent,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6108,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 40, right: 40),
                              child: CustomText(
                                text: StringKey.welcome.tr,
                                color: ColorSelect.textColor,
                                fontsize: 34,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w600,
                                textOverflow: TextOverflow.clip,
                                height: 0.0,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 40, right: 40),
                                child: GetBuilder<AuthViewModel>(
                                    init: AuthViewModel(),
                                    builder: (controller) {
                                      return Form(
                                        key: controller.formKeySignIn,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12)),
                                                    color:
                                                        ColorSelect.iconPerson,
                                                  ),
                                                  child: Icon(
                                                    Icons.email_outlined,
                                                    color: ColorSelect
                                                        .primarycolor,
                                                    size: 35,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.55,
                                                    child: TextFormField(
                                                      cursorColor:
                                                          ColorSelect.textColor,
                                                      controller: controller
                                                          .emailSingIn,
                                                      obscureText: false,
                                                      validator: (value) {
                                                        if (value!.isEmpty ||
                                                            !GetUtils.isEmail(value
                                                                .toString())) {
                                                          return StringKey
                                                              .correctEmailSignin
                                                              .tr;
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        label: CustomText(
                                                          text: StringKey
                                                              .email.tr,
                                                          color: ColorSelect
                                                              .textColor,
                                                          fontsize: 11,
                                                          textAlign:
                                                              TextAlign.start,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          textOverflow:
                                                              TextOverflow.clip,
                                                          height: 0.0,
                                                        ),
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorSelect
                                                                .underlineText,
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorSelect
                                                                .underlineText,
                                                          ),
                                                        ),
                                                      ),
                                                      style: TextStyle(
                                                          color: ColorSelect
                                                              .primarycolor,
                                                          decorationColor:
                                                              ColorSelect
                                                                  .transparent,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12)),
                                                    color:
                                                        ColorSelect.iconPerson,
                                                  ),
                                                  child: Icon(
                                                    Icons.lock_outline,
                                                    color: ColorSelect
                                                        .primarycolor,
                                                    size: 35,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.55,
                                                    child: TextFormField(
                                                      cursorColor:
                                                          ColorSelect.textColor,
                                                      controller: controller
                                                          .passwordSignIn,
                                                      obscureText: controller.showSignIn,
                                                      validator: (value) {
                                                        if (value
                                                                    .toString()
                                                                    .length <
                                                                6 ||
                                                            value!.isEmpty) {
                                                          return StringKey
                                                              .correctPassword
                                                              .tr;
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                            suffixIcon: InkWell(
                                                      onTap: () {
                                                        controller
                                                            .changeStatePasswordSignIn(
                                                                !controller
                                                                    .showSignIn);
                                                        if (controller.showSignIn ==
                                                            false) {
                                                          show = Icons
                                                              .visibility_outlined;
                                                        } else {
                                                          show = Icons
                                                              .visibility_off_outlined;
                                                        }
                                                      },
                                                      child: Icon(
                                                        show,
                                                        color: ColorSelect
                                                            .primarycolor,
                                                      ),
                                                    ),
                                                        label: CustomText(
                                                          text: StringKey
                                                              .password.tr,
                                                          color: ColorSelect
                                                              .textColor,
                                                          fontsize: 11,
                                                          textAlign:
                                                              TextAlign.start,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          textOverflow:
                                                              TextOverflow.clip,
                                                          height: 0.0,
                                                        ),
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorSelect
                                                                .underlineText,
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorSelect
                                                                .underlineText,
                                                          ),
                                                        ),
                                                      ),
                                                      style: TextStyle(
                                                          color: ColorSelect
                                                              .primarycolor,
                                                          decorationColor:
                                                              ColorSelect
                                                                  .transparent,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    })),
                            const SizedBox(
                              height: 20,
                            ),
                            GetBuilder<AuthViewModel>(
                                init: AuthViewModel(),
                                builder: (controller) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: CustomBotton(
                                      text: StringKey.continuee.tr,
                                      width: double.infinity,
                                      height: 48,
                                      fontWeight: FontWeight.w600,
                                      function: () {
                                        controller.formKeySignIn.currentState!
                                            .save();
                                        if (controller
                                            .formKeySignIn.currentState!
                                            .validate()) {
                                          controller
                                              .signInWithEmailAndPassword();
                                        }
                                      },
                                      color: ColorSelect.whiteColor,
                                      backgroundcolor: ColorSelect.primarycolor,
                                      textAlign: TextAlign.center,
                                      fontsize: 17,
                                    ),
                                  );
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 40, right: 40),
                              child: InkWell(
                                onTap: () => Get.offAll(() => ResetPassword()),
                                child: CustomText(
                                  text: StringKey.forgetPassword.tr,
                                  color: ColorSelect.primarycolor,
                                  fontsize: 12,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w600,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 40, right: 40),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Divider(
                                      thickness: 1.5,
                                      color: ColorSelect.underlineText,
                                    ),
                                  ),
                                  CustomText(
                                    text: StringKey.or.tr,
                                    color: ColorSelect.textColor,
                                    fontsize: 14,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w400,
                                    textOverflow: TextOverflow.clip,
                                    height: 0.0,
                                  ),
                                  Expanded(
                                    child: Divider(
                                      thickness: 1.5,
                                      color: ColorSelect.underlineText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GetBuilder<AuthViewModel>(
                              init: AuthViewModel(),
                              builder: (controller) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomBottonSocial(
                                      text: 'Facebook',
                                      image: ImagesPath.facebook,
                                      width: 150,
                                      height: 48,
                                      fontWeight: FontWeight.w600,
                                      function: () {
                                        controller.signInWithFacebook();
                                      },
                                      color: ColorSelect.primarycolor,
                                      backgroundcolor: ColorSelect.whiteColor,
                                      textAlign: TextAlign.center,
                                      fontsize: 17,
                                    ),
                                    CustomBottonSocial(
                                      text: 'Google',
                                      image: ImagesPath.google,
                                      width: 150,
                                      height: 48,
                                      fontWeight: FontWeight.w600,
                                      function: () {
                                        controller.googleSignInMethod();
                                      },
                                      color: ColorSelect.primarycolor,
                                      backgroundcolor: ColorSelect.whiteColor,
                                      textAlign: TextAlign.center,
                                      fontsize: 17,
                                    ),
                                  ],
                                );
                              }
                            ),
                            const SizedBox(
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
                  left: (MediaQuery.of(context).size.width * 0.4729) + 42,
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
      ]),
    );
  }
}
