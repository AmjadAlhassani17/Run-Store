// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/core/path/images_path.dart';
import 'package:runstore/featcher/view/login_screens_view/forget_password_view/verification_code_view.dart';
import 'package:runstore/featcher/view/login_screens_view/signin_account_view.dart';
import 'package:runstore/featcher/view/widgets/custom_button.dart';
import 'package:runstore/featcher/view/widgets/custom_button_social.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import 'package:runstore/utils/locale/language_all.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
              height: MediaQuery.of(context).size.height * 0.4384,
              width: double.infinity,
              child: Image.asset(ImagesPath.resetPassword, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6009,
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
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: CustomText(
                          text:
                              StringKey.reset_password_Discription.tr,
                          color: ColorSelect.textColor,
                          fontsize: 17,
                          textAlign: TextAlign.center,
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
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
                                      Icons.email_outlined,
                                      color: ColorSelect.primarycolor,
                                      size: 35,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        child: TextFormField(
                                          cursorColor: ColorSelect.textColor,
                                          controller: email,
                                          obscureText: false,
                                          validator: (value) {
                                            if (value!.isEmpty ||
                                                !GetUtils.isEmail(
                                                    value.toString())) {
                                              return StringKey.correctEmailSignin.tr;
                                            } else {
                                              return null;
                                            }
                                          },
                                          onSaved: (value) {},
                                          decoration: InputDecoration(
                                            label: CustomText(
                                              text: StringKey.email.tr,
                                              color: ColorSelect.textColor,
                                              fontsize: 11,
                                              textAlign: TextAlign.start,
                                              fontWeight: FontWeight.w600,
                                              textOverflow: TextOverflow.clip,
                                              height: 0.0,
                                            ),
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
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor:
                                                ColorSelect.transparent,
                                            color: ColorSelect.primarycolor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: CustomBotton(
                          text: StringKey.sendReset.tr,
                          width: double.infinity,
                          height: 48,
                          fontWeight: FontWeight.w600,
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              Get.offAll(() => VerificationCode());
                            }
                          },
                          color: ColorSelect.whiteColor,
                          backgroundcolor: ColorSelect.primarycolor,
                          textAlign: TextAlign.center,
                          fontsize: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: CustomBottonSocial(
                          text: StringKey.backSignIn.tr,
                          width: double.infinity,
                          image: ImagesPath.backArrow,
                          height: 48,
                          fontWeight: FontWeight.w600,
                          function: () => Get.offAll(() => SignInAccount()),
                          color: ColorSelect.primarycolor,
                          backgroundcolor: ColorSelect.whiteColor,
                          textAlign: TextAlign.center,
                          fontsize: 17,
                        ),
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
