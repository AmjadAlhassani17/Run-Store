// ignore_for_file: must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/view/hint_screens_view/welcome_four_hint.dart';
import 'package:runstore/featcher/view/hint_screens_view/welcome_hint.dart';
import 'package:runstore/featcher/view/hint_screens_view/welcome_three_hint.dart';
import 'package:runstore/featcher/view/hint_screens_view/welcome_two_hint.dart';
import 'package:runstore/featcher/view/login_screens_view/creat_account_view.dart';
import 'package:runstore/utils/locale/language_all.dart';
import '../../core/colors/colors.dart';
import '../../view_model/login_view_model.dart';
import '../widgets/custom_button.dart';

class HintView extends StatelessWidget {
  HintView({Key? key}) : super(key: key);

  static LoginViewModel loginViewModel =
      Get.put(LoginViewModel(), permanent: true);

  PageController pageController = PageController();

  List<Widget> _list = <Widget>[
    WelcomeHint(),
    WelcomeHint2(),
    WelcomeHint3(),
    WelcomeHint4(),
  ];

  void nextPage() {
    loginViewModel.update();
    loginViewModel.state <= 1 ? Future.delayed(Duration(milliseconds: 2500), (() {   
       loginViewModel.state <= 2 ? pageController.nextPage(
          duration: const Duration(milliseconds: 1500), curve: Curves.ease) : null;
          loginViewModel.update();
          loginViewModel.state <= 1 ? nextPage() : null;
          loginViewModel.update();
          
    })) : null;
    loginViewModel.state++;
    loginViewModel.update();
// nextPage();
  }

  @override
  Widget build(BuildContext context) {
    nextPage();
    return Scaffold(
      body: GetBuilder<LoginViewModel>(
        init: LoginViewModel(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 640,
                  width: double.infinity,
                  child: PageView(
                      children: _list,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      controller: pageController,
                      onPageChanged: (num) {
                        controller.state = num;
                        controller.changeState(num);
                      },),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: controller.state == 0
                            ? controller.colorSelect
                            : controller.colorUnSelect,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: controller.state == 1
                            ? controller.colorSelect
                            : controller.colorUnSelect,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: controller.state == 2
                            ? controller.colorSelect
                            : controller.colorUnSelect,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: controller.state == 3
                            ? controller.colorSelect
                            : controller.colorUnSelect,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                    ),

                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                 Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Visibility(
                      visible: loginViewModel.state == 3,
                      maintainAnimation: !(loginViewModel.state == 3),
                      maintainState: !(loginViewModel.state == 3),
                      maintainSize: !(loginViewModel.state == 3),
                      child: CustomBotton(
                          text: StringKey.start.tr,
                          width: 300,
                          height: 50,
                          fontWeight: FontWeight.w600,
                          function: () {
                            Get.offAll(() => CreateAccount());
                          },
                          color: ColorSelect.whiteColor,
                          backgroundcolor: ColorSelect.primarycolor,
                          textAlign: TextAlign.center,
                          fontsize: 17),
                    ),
                  ),
                ),
                //     Expanded(
                //   child: Align(
                // alignment: FractionalOffset.bottomCenter,
                // child: Padding(
                //   padding: const EdgeInsets.only(bottom: 20),
                //   child: CustomBotton(
                //       text: "Get started",
                //       width: 300,
                //       height: 50,
                //       fontWeight: FontWeight.w600,
                //       function: () {},
                //       color: ColorSelect.whiteColor,
                //       backgroundcolor: ColorSelect.primarycolor,
                //       textAlign: TextAlign.center,
                //       fontsize: 17),
                // ),
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
