// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/view/hint_screens_view/welcome_view.dart';
import 'package:runstore/featcher/view/login_screens_view/forget_password_view/reset_password.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:runstore/utils/locale/language_all.dart';
import '../../../../utils/constants.dart';
import '../../../view_model/login_view_model.dart';

class VerificationCode extends StatelessWidget {
  VerificationCode({Key? key}) : super(key: key);
  TextEditingController password = TextEditingController();

  static LoginViewModel loginViewModel =
      Get.put(LoginViewModel(), permanent: true);

  Color abc = ColorSelect.primarycolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.iconPerson,
      body: ListView(
        padding: EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.offAll(() => ResetPassword()),
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
                InkWell(
                  onTap: () {},
                  child: CustomText(
                    text: StringKey.resend.tr,
                    color: ColorSelect.textColor,
                    fontsize: 17,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    textOverflow: TextOverflow.clip,
                    height: 0.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8472,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    CustomText(
                      text: StringKey.verificationCode.tr,
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
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: CustomText(
                        text:
                            StringKey.verificationCodeDiscription.tr,
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
                    GetBuilder<LoginViewModel>(
                        init: LoginViewModel(),
                        builder: (controller) {
                          return Stack(
                            children: [       
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 56,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      color: ColorSelect.iconPerson,
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        text: controller.passwordLenght > 0
                                            ? password.text[0]
                                            : ' ',
                                        color: abc,
                                        fontsize: 28,
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.w200,
                                        textOverflow: TextOverflow.clip,
                                        height: 0.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    height: 56,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      color: ColorSelect.iconPerson,
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        text: controller.passwordLenght > 1
                                            ? password.text[1]
                                            : ' ',
                                        color: abc,
                                        fontsize: 28,
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.w200,
                                        textOverflow: TextOverflow.clip,
                                        height: 0.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    height: 56,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      color: ColorSelect.iconPerson,
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        text: controller.passwordLenght > 2
                                            ? password.text[2]
                                            : ' ',
                                        color: abc,
                                        fontsize: 28,
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.w200,
                                        textOverflow: TextOverflow.clip,
                                        height: 0.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    height: 56,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      color: ColorSelect.iconPerson,
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        text: controller.passwordLenght > 3
                                            ? password.text[3]
                                            : ' ',
                                        color: abc,
                                        fontsize: 28,
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.w200,
                                        textOverflow: TextOverflow.clip,
                                        height: 0.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    height: 56,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      color: ColorSelect.iconPerson,
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        text: controller.passwordLenght > 4
                                            ? password.text[4]
                                            : ' ',
                                        color: abc,
                                        fontsize: 28,
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.w200,
                                        textOverflow: TextOverflow.clip,
                                        height: 0.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TextField(
                                keyboardType: TextInputType.number,
                                controller: password,
                                onChanged: ((value) {
                                  controller.changePasswordLenght(
                                      lenght: value.length);
                                  value.length == 5
                                      ? Constant.password?.compareTo(value) == 0
                                          ? Get.offAll(const WelcomeScreen())
                                          : abc = ColorSelect.errorTextField
                                      : abc = ColorSelect.primarycolor;
                                }),
                                maxLength: 5,
                                cursorColor: ColorSelect.transparent,
                                showCursor: false,
                                enableInteractiveSelection: true,
                                style: const TextStyle(
                                    color: ColorSelect.transparent),
                                decoration: const InputDecoration(
                                  fillColor: ColorSelect.blackColor,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorSelect.transparent),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorSelect.transparent),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorSelect.transparent),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
