import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/view/widgets/custom_button.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';

import '../../../../core/colors/colors.dart';
import '../../../../view_model/check_out_view_model.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({Key? key}) : super(key: key);
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
          child: Column(
            children: [
              CustomText(
                text: 'Payment',
                color: ColorSelect.textColor,
                fontsize: 22,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
                textOverflow: TextOverflow.clip,
                height: 0.0,
              ),
              SizedBox(
                height: 50,
              ),
              GetBuilder<CheckOutViewModel>(
                init: CheckOutViewModel(),
                builder: (controller) {
                  return CustomBotton(
                    text: 'Next',
                    width: 150,
                    height: 35,
                    fontWeight: FontWeight.w400,
                    function: () {
                      controller.changeStateCheckOut(index: 3);
                    
                    },
                    color: ColorSelect.whiteColor,
                    backgroundcolor: ColorSelect.primarycolor,
                    textAlign: TextAlign.center,
                    fontsize: 12,
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
