import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/path/svgs_path.dart';
import 'package:runstore/featcher/view/widgets/container_without_shadow.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import 'package:runstore/utils/locale/language_all.dart';
import '../../../../core/colors/colors.dart';
import '../../../../view_model/check_out_view_model.dart';
import '../../../widgets/container_with_shadow.dart';
import '../../../widgets/custom_button_all.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({Key? key}) : super(key: key);
  static final CheckOutViewModel checkOutViewModel = Get.find<CheckOutViewModel>();

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
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30 ,horizontal: 20),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: GetBuilder<CheckOutViewModel>(
                init: CheckOutViewModel(),
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        controller.statePrice == 0 ? ContainerWithShadow(text: '${StringKey.free.tr} - \$0.00', price: '3-5 ${StringKey.dayDelivery.tr}', pathSvg: SvgsPath.checkmarkdone) : InkWell(onTap: () => controller.changeStatePrice(index: 0),
                          child: ContainerWithOutShadow(text: '${StringKey.free.tr} - \$0.00', price: '3-5 ${StringKey.dayDelivery.tr}', pathSvg: SvgsPath.checkmark)),
                        SizedBox(height: 16,),
                        controller.statePrice == 1 ? ContainerWithShadow(text: '${StringKey.standard.tr} - \$2.50', price: '2-3 ${StringKey.dayDelivery.tr}', pathSvg: SvgsPath.checkmarkdone) : InkWell(onTap: () => controller.changeStatePrice(index: 1),
                          child: ContainerWithOutShadow(text: '${StringKey.standard.tr} - \$2.50', price: '2-3 ${StringKey.dayDelivery.tr}', pathSvg: SvgsPath.checkmark)),
                        SizedBox(height: 16,),
                        controller.statePrice == 2 ? ContainerWithShadow(text: '${StringKey.express.tr} - \$5.99', price: '${StringKey.next.tr} ${StringKey.dayDelivery.tr}', pathSvg: SvgsPath.checkmarkdone) : InkWell(onTap: () => controller.changeStatePrice(index: 2),
                          child: ContainerWithOutShadow(text: '${StringKey.express.tr} - \$5.99', price: '${StringKey.next.tr} ${StringKey.dayDelivery.tr}', pathSvg: SvgsPath.checkmark)),
                        
                        SizedBox(
                          height: 23,
                        ),
            
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                          child: CustomText(text: '${StringKey.freeShopping.tr} \$49 + ${StringKey.freeReturn.tr}', color: ColorSelect.PriceNewArrival, fontsize: 14, textAlign: TextAlign.center, fontWeight: FontWeight.w400, textOverflow: TextOverflow.clip, height: 0.0,),
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        GetBuilder<CheckOutViewModel>(
                          init: CheckOutViewModel(),
                          builder: (controller) {
                            return Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 15),
                              child: CustomBottonAll(
                                text: StringKey.next.tr,
                                width: double.infinity,
                                height: 48,
                                fontWeight: FontWeight.w600,
                                function: () {
                                   controller.changeStateCheckOut(index: 2);
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
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
