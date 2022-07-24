import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/core/path/svgs_path.dart';
import 'package:runstore/featcher/view/hint_screens_view/welcome_view.dart';
import 'package:runstore/featcher/view_model/control_view_model.dart';
import '../view_model/auth_view_model.dart';

class ControlView extends StatelessWidget {
  const ControlView({Key? key}) : super(key: key);

  static AuthViewModel authViewModel =
      Get.put(AuthViewModel(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (authViewModel.user == null)
          ? WelcomeScreen()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                backgroundColor: controller.navigator == 2 ? ColorSelect.iconPerson : ColorSelect.whiteColor,
                body: controller.currentScrren,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: ColorSelect.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: -5,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: GetBuilder<ControlViewModel>(
            init: ControlViewModel(),
            builder: (controller) => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0.5,
              backgroundColor: ColorSelect.whiteColor,
              currentIndex: controller.navigator,
              onTap: (index) {
                controller.ChangeNavigatorValue(index);
              },
              items: [
                BottomNavigationBarItem(
                    label: '',
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SvgPicture.asset(
                        SvgsPath.home,
                        color: controller.navigator == 0
                            ? ColorSelect.Select
                            : ColorSelect.unSelect,
                      ),
                    )),
                BottomNavigationBarItem(
                    label: '',
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SvgPicture.asset(
                        SvgsPath.categories,
                        fit: BoxFit.contain,
                        color: controller.navigator == 1
                            ? ColorSelect.Select
                            : ColorSelect.unSelect,
                      ),
                    )),
                BottomNavigationBarItem(
                    label: '',
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SvgPicture.asset(
                        SvgsPath.cart,
                        fit: BoxFit.contain,
                        color: controller.navigator == 2
                            ? ColorSelect.Select
                            : ColorSelect.unSelect,
                      ),
                    )),
                BottomNavigationBarItem(
                    label: '',
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SvgPicture.asset(
                        SvgsPath.love,
                        fit: BoxFit.contain,
                        color: controller.navigator == 3
                            ? ColorSelect.Select
                            : ColorSelect.unSelect,
                      ),
                    )),
                BottomNavigationBarItem(
                    label: '',
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SvgPicture.asset(
                        SvgsPath.person2,
                        fit: BoxFit.contain,
                        color: controller.navigator == 4
                            ? ColorSelect.Select
                            : ColorSelect.unSelect,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
