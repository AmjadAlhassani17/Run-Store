// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/view/app_screens_view/home_view.dart';
import 'package:runstore/featcher/view/widgets/custom_button.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import '../../../../../utils/locale/language_all.dart';
import '../../../../core/colors/colors.dart';
import '../../../../view_model/check_out_view_model.dart';

class AddressView extends StatefulWidget {
  AddressView({Key? key}) : super(key: key);
  static final CheckOutViewModel checkOutViewModel =
      Get.find<CheckOutViewModel>();
  static final TextEditingController address =
      TextEditingController(text: '${HomeView.addressName}');
      
  static final TextEditingController city =
      TextEditingController(text: '${HomeView.cityName}');
  static final TextEditingController zip =
      TextEditingController(text: '${HomeView.zipCode}');
  static final TextEditingController name = TextEditingController(
      text: '${FirebaseAuth.instance.currentUser?.displayName}');
  static final TextEditingController state =
      TextEditingController(text: '${HomeView.stateName}');
  static final TextEditingController phoneNumber = TextEditingController();

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.6699,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: ColorSelect.whiteColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 45,
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
                                controller: AddressView.name,
                                obscureText: false,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      value.toString().length < 6) {
                                    return StringKey.correctName.tr;
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  label: CustomText(
                                    text: StringKey.name.tr,
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
                                controller: AddressView.address,
                                obscureText: false,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      value.toString().length < 6) {
                                    return StringKey.correctAddress.tr;
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  label: CustomText(
                                    text: StringKey.address.tr,
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
                                  controller: AddressView.city,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return StringKey.correctCity.tr;
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    label: CustomText(
                                      text: StringKey.city.tr,
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
                                  controller: AddressView.zip,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        value.toString().length != 5) {
                                      return StringKey.correctZip.tr;
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    label: CustomText(
                                      text: StringKey.zip.tr,
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
                                controller: AddressView.state,
                                obscureText: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return StringKey.correctState.tr;
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  label: CustomText(
                                    text: StringKey.state.tr,
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
                                controller: AddressView.phoneNumber,
                                obscureText: false,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !GetUtils.isPhoneNumber(
                                          value.toString())) {
                                    return StringKey.correctPhone.tr;
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  label: CustomText(
                                    text: StringKey.phone.tr,
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
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GetBuilder<CheckOutViewModel>(
                init: CheckOutViewModel(),
                builder: (controller) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: CustomBotton(
                      text: StringKey.next.tr,
                      width: double.infinity,
                      height: 48,
                      fontWeight: FontWeight.w600,
                      function: () {
                        formKey.currentState!.save();
                                  if (formKey.currentState!
                                      .validate()) {
                                    controller.changeStateCheckOut(index: 1);
                                  }
                        // controller.changeStateCheckOut(index: 1);
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
    );
  }
}
