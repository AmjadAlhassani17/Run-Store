import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/view/app_screens_view/sup_category_view/man_sup_category_view.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';

class ShoppingView extends StatelessWidget {
  const ShoppingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorSelect.transparent,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ListTile(
              leading: Container(
                height: 48,
                width: 48,
              ),
              title: CustomText(
                text: 'Shopping cart',
                color: ColorSelect.textColor,
                fontsize: 17,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
                textOverflow: TextOverflow.clip,
                height: 0.0,
              ),
              trailing: InkWell(
                onTap: () => Get.to(() => ManSupCategoryView()),
                child: Container(
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
                  child: Icon(
                    Icons.add_outlined,
                    color: ColorSelect.blackColor,
                    size: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: ColorSelect.PriceNewArrival,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2139,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: ColorSelect.TextKid,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
