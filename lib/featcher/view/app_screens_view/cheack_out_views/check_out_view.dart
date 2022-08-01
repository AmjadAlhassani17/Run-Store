import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/view/app_screens_view/cheack_out_views/body_view/address_view.dart';
import 'package:runstore/featcher/view/app_screens_view/cheack_out_views/body_view/confirm_view.dart';
import 'package:runstore/featcher/view/app_screens_view/cheack_out_views/body_view/delivery_view.dart';
import 'package:runstore/utils/locale/language_all.dart';
import '../../../view_model/check_out_view_model.dart';
import '../../widgets/custom_text.dart';


class CheckOutView extends StatefulWidget {
  CheckOutView({Key? key}) : super(key: key);

  static final CheckOutViewModel checkOutViewModel = Get.put(CheckOutViewModel(),permanent: true);

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: ColorSelect.scaffoldBackgroundColorCatagories,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                ListTile(
                  leading: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
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
                    child: InkWell(
                      onTap: () => controller.state > 0 ? controller.changeStateCheckOut(index: controller.state - 1) : Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: ColorSelect.blackColor,
                        size: 25,
                      ),
                    ),
                  ),
                  title: CustomText(
                    text: controller.state == 0 ? StringKey.address.tr : controller.state == 1 ? StringKey.delivery.tr : controller.state == 2 ? StringKey.confirmOrder.tr : '',
                    color: ColorSelect.textColor,
                    fontsize: 17,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    textOverflow: TextOverflow.clip,
                    height: 0.0,
                  ),
                  trailing: Container(
                    height: 48,
                    width: 48,
                  ),
                ),
                const SizedBox(
                  height: 56,
                ),
                Container(
                  width: 300,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 300,
                        child: Divider(
                          color: ColorSelect.primarycolor,
                          thickness: 2.5,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.state >= 0
                                    ? ColorSelect.primarycolor
                                    : Colors.white,
                                border: Border.all(
                                  color: ColorSelect.primarycolor,
                                  width: 2,
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.state > 0
                                    ? ColorSelect.primarycolor
                                    : Colors.white,
                                border: Border.all(
                                  color: ColorSelect.primarycolor,
                                  width: 2,
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.state > 1
                                    ? ColorSelect.primarycolor
                                    : Colors.white,
                                border: Border.all(
                                  color: ColorSelect.primarycolor,
                                  width: 2,
                                ),
                              ),
                            ),
                            
                        ],
                      ),
                      
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 34),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(text: StringKey.address.tr, color: controller.state == 0 ? ColorSelect.primarycolor : ColorSelect.unSelect, fontsize: 14, textAlign: TextAlign.center, fontWeight: FontWeight.w400, textOverflow: TextOverflow.clip, height: 0.0,),
                            CustomText(text: StringKey.delivery.tr, color: controller.state == 1 ? ColorSelect.primarycolor : ColorSelect.unSelect, fontsize: 14, textAlign: TextAlign.center, fontWeight: FontWeight.w400, textOverflow: TextOverflow.clip, height: 0.0,),
                            CustomText(text: StringKey.confirm.tr, color: controller.state == 2 ? ColorSelect.primarycolor : ColorSelect.unSelect, fontsize: 14, textAlign: TextAlign.center, fontWeight: FontWeight.w400, textOverflow: TextOverflow.clip, height: 0.0,),
                          ],
                        ),
                      ),
                const SizedBox(height: 50,),
                controller.state == 0 ? AddressView() : controller.state == 1 ? DeliveryView() : controller.state == 2 ? ConfirmView()  : Container(),
              ],
            ),
          ),
        );
      }
    );
  }

  

}
