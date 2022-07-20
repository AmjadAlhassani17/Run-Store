// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/core/path/images_path.dart';
import 'package:runstore/featcher/view/login_screens_view/signin_account_view.dart';
import 'package:runstore/featcher/view/widgets/custom_button.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import 'package:runstore/utils/locale/language_all.dart';
import 'package:get/get.dart';
import '../../view_model/auth_view_model.dart';

class NewAccount extends StatelessWidget {
  NewAccount({Key? key}) : super(key: key);

  static AuthViewModel authViewModel =
      Get.put(AuthViewModel(), permanent: true);

  IconData show = Icons.visibility_off_outlined;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3300,
                  width: double.infinity,
                  child: Image.asset(ImagesPath.newAccount, fit: BoxFit.cover),
                ),
                Positioned(
                    top: 40,
                    right: MediaQuery.of(context).size.width * 0.100,
                    child: InkWell(
                      onTap: () => Get.offAll(() => SignInAccount()),
                      child: CustomText(
                        text: StringKey.signin.tr,
                        color: ColorSelect.textColor,
                        fontsize: 17,
                        textAlign: TextAlign.right,
                        fontWeight: FontWeight.w600,
                        textOverflow: TextOverflow.clip,
                        height: 0.0,
                      ),
                    ))
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7093,
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
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: CustomText(
                          text: StringKey.newAccount.tr,
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
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: GetBuilder<AuthViewModel>(
                              init: AuthViewModel(),
                              builder: (controller) {
                                return Form(
                                    key: controller.formKey,
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                                color: ColorSelect.iconPerson,
                                              ),
                                              child: Icon(
                                                Icons.person,
                                                color: ColorSelect.primarycolor,
                                                size: 35,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.55,
                                                child: TextFormField(
                                                  cursorColor:
                                                      ColorSelect.textColor,
                                                  controller: controller.name,
                                                  obscureText: false,
                                                  validator: (value) {
                                                    if (value!.isEmpty || value.toString().length < 6) {
                                                      return StringKey.correctName.tr;
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                    label: CustomText(
                                                      text:
                                                          StringKey.fullname.tr,
                                                      color:
                                                          ColorSelect.textColor,
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
                                                      borderSide: BorderSide(
                                                        color: ColorSelect
                                                            .underlineText,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: ColorSelect
                                                            .underlineText,
                                                      ),
                                                    ),
                                                  ),
                                                  style: TextStyle(
                                                    color: ColorSelect
                                                        .primarycolor,
                                                    decorationColor:
                                                        ColorSelect.transparent,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                                color: ColorSelect.iconPerson,
                                              ),
                                              child: Icon(
                                                Icons.email_outlined,
                                                color: ColorSelect.primarycolor,
                                                size: 35,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.55,
                                                child: TextFormField(
                                                  cursorColor:
                                                      ColorSelect.textColor,
                                                  controller: controller.email,
                                                  obscureText: false,
                                                  validator: (value) {
                                                    if (value!.isEmpty ||
                                                        !GetUtils.isEmail(
                                                            value.toString())) {
                                                      return StringKey
                                                          .correctEmail.tr;
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                    label: CustomText(
                                                      text: StringKey.email.tr,
                                                      color:
                                                          ColorSelect.textColor,
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
                                                      borderSide: BorderSide(
                                                        color: ColorSelect
                                                            .underlineText,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: ColorSelect
                                                            .underlineText,
                                                      ),
                                                    ),
                                                  ),
                                                  style: TextStyle(
                                                    color: ColorSelect
                                                        .primarycolor,
                                                    fontSize: 16,
                                                    decorationColor:
                                                        ColorSelect.transparent,
                                                    fontWeight: FontWeight.w400,
                                                  ),
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
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
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.55,
                                                child: TextFormField(
                                                  cursorColor: Color.fromRGBO(
                                                      33, 43, 54, 1),
                                                  controller:
                                                      controller.password,
                                                  obscureText: controller.show,
                                                  validator: (value) {
                                                    if (value
                                                                .toString()
                                                                .length <
                                                            6 ||
                                                        value!.isEmpty) {
                                                      return StringKey
                                                          .correctPassword.tr;
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                    suffixIcon: InkWell(
                                                      onTap: () {
                                                        controller
                                                            .changeStatePassword(
                                                                !controller
                                                                    .show);
                                                        if (controller.show ==
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
                                                      text:
                                                          StringKey.password.tr,
                                                      color:
                                                          ColorSelect.textColor,
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
                                                      borderSide: BorderSide(
                                                        color: ColorSelect
                                                            .underlineText,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: ColorSelect
                                                            .underlineText,
                                                      ),
                                                    ),
                                                  ),
                                                  style: TextStyle(
                                                    color: ColorSelect
                                                        .primarycolor,
                                                    fontSize: 16,
                                                    decorationColor:
                                                        ColorSelect.transparent,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ));
                              })),
                      const SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthViewModel>(
                          init: AuthViewModel(),
                          builder: (controller) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: CustomBotton(
                                text: StringKey.createAnAccount.tr,
                                width: double.infinity,
                                height: 48,
                                fontWeight: FontWeight.w600,
                                function: () {
                                  controller.formKey.currentState!.save();
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller
                                        .creatAccountWithEmailAndPassword();
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
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: StringKey.By.tr,
                            color: ColorSelect.textColor,
                            fontsize: 14,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                            textOverflow: TextOverflow.clip,
                            height: 0.0,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: CustomText(
                              text: StringKey.terms.tr,
                              color: ColorSelect.primarycolor,
                              fontsize: 14,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w600,
                              textOverflow: TextOverflow.clip,
                              height: 0.0,
                            ),
                          ),
                          CustomText(
                            text: StringKey.and.tr,
                            color: ColorSelect.textColor,
                            fontsize: 14,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                            textOverflow: TextOverflow.clip,
                            height: 0.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: CustomText(
                              text: StringKey.conditions.tr,
                              color: ColorSelect.primarycolor,
                              fontsize: 14,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w600,
                              textOverflow: TextOverflow.clip,
                              height: 0.0,
                            ),
                          )
                        ],
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
        ],
      ),
    );
  }
}
