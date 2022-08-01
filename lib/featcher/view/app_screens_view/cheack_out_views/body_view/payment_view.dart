// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/path/images_path.dart';
import '../../../../core/colors/colors.dart';
import '../../../../view_model/check_out_view_model.dart';
import '../../../widgets/custom_button_all.dart';
import '../../../widgets/custom_text.dart';

class PaymentView extends StatelessWidget {
  PaymentView({Key? key}) : super(key: key);
  static final CheckOutViewModel checkOutViewModel =
      Get.find<CheckOutViewModel>();
  TextEditingController cartNumber = TextEditingController();
  TextEditingController cardName = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController cvv = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.6699,
        padding: EdgeInsets.symmetric(vertical: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: ColorSelect.whiteColor,
        ),
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: ColorSelect.whiteColor),
                          color: ColorSelect.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: Offset(0, 0.75),
                            ),
                          ],
                        ),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorSelect.ImageColor,
                          ),
                          child: Image.asset(
                            ImagesPath.iconMyfatoorah,
                            width: 80,
                            height: 60,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: TextFormField(
                                  cursorColor: ColorSelect.primarycolor,
                                  controller: cartNumber,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        value.toString().length != 16 ) {
                                      return 'Enter correct Cart Number.';
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    label: CustomText(
                                      text: 'Card number',
                                      color: ColorSelect.textColor,
                                      fontsize: 11,
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w600,
                                      textOverflow: TextOverflow.clip,
                                      height: 0.0,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ColorSelect.underlineText,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ColorSelect.underlineText,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: ColorSelect.primarycolor,
                                    decorationColor: ColorSelect.transparent,
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: TextFormField(
                                  cursorColor: ColorSelect.primarycolor,
                                  controller: cardName,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        value.toString().length < 6) {
                                      return 'Enter correct cart name.';
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    label: CustomText(
                                      text: 'Cardholder name',
                                      color: ColorSelect.textColor,
                                      fontsize: 11,
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w600,
                                      textOverflow: TextOverflow.clip,
                                      height: 0.0,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ColorSelect.underlineText,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ColorSelect.underlineText,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: ColorSelect.primarycolor,
                                    decorationColor: ColorSelect.transparent,
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
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  child: TextFormField(
                                    cursorColor: ColorSelect.primarycolor,
                                    controller: date,
                                    obscureText: false,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          value.toString().length != 4) {
                                        return 'Enter correct Expiry date.';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      label: CustomText(
                                        text: 'Expiry date',
                                        color: ColorSelect.textColor,
                                        fontsize: 11,
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.w600,
                                        textOverflow: TextOverflow.clip,
                                        height: 0.0,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorSelect.underlineText,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorSelect.underlineText,
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: ColorSelect.primarycolor,
                                      decorationColor: ColorSelect.transparent,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.20,
                                  child: TextFormField(
                                    cursorColor: ColorSelect.primarycolor,
                                    controller: cvv,
                                    obscureText: false,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          value.toString().length != 4) {
                                        return 'Enter correct cvv.';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      label: CustomText(
                                        text: 'CVV',
                                        color: ColorSelect.textColor,
                                        fontsize: 11,
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.w600,
                                        textOverflow: TextOverflow.clip,
                                        height: 0.0,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorSelect.underlineText,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorSelect.underlineText,
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: ColorSelect.primarycolor,
                                      decorationColor: ColorSelect.transparent,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],),
                      ]
                    ),
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                GetBuilder<CheckOutViewModel>(
                  init: CheckOutViewModel(),
                  builder: (controller) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: CustomBottonAll(
                        text: 'Next',
                        width: double.infinity,
                        height: 48,
                        fontWeight: FontWeight.w600,
                        function: () {
                          // formKey.currentState!.save();
                          //         if (formKey.currentState!
                          //             .validate()) {
                          //           controller.changeStateCheckOut(index: 3);
                          //         }
                         controller.changeStateCheckOut(index: 3);
                        },
                        color: ColorSelect.whiteColor,
                        backgroundcolor: ColorSelect.primarycolor,
                        textAlign: TextAlign.center,
                        fontsize: 17,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
