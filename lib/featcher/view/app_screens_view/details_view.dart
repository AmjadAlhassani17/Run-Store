import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/core/path/images_path.dart';
import 'package:runstore/featcher/core/path/svgs_path.dart';
import 'package:runstore/featcher/view/app_screens_view/search_view.dart';
import 'package:runstore/featcher/view/app_screens_view/sup_category_view/clothing_view.dart';
import 'package:runstore/featcher/view/app_screens_view/sup_category_view/electronics_view.dart';
import 'package:runstore/featcher/view/app_screens_view/sup_category_view/furniture_view.dart';
import 'package:runstore/featcher/view/app_screens_view/sup_category_view/kid_sup_caregory_view.dart';
import 'package:runstore/featcher/view/app_screens_view/sup_category_view/man_sup_category_view.dart';
import 'package:runstore/featcher/view/app_screens_view/sup_category_view/others_view.dart';
import 'package:runstore/featcher/view/app_screens_view/sup_category_view/shoes_view.dart';
import 'package:runstore/featcher/view/app_screens_view/sup_category_view/women_sup_category_view.dart';
import 'package:runstore/featcher/view/widgets/custom_brand_list_tail.dart';
import 'package:runstore/featcher/view/widgets/custom_buttpn_view_all.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import 'package:runstore/featcher/view_model/dio_method_view_model.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  static final DioMethods dioMethods = Get.put(DioMethods(), permanent: true);

  @override
  Widget build(BuildContext context) {
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
              ),
              title: CustomText(
                text: 'Catalog',
                color: ColorSelect.textColor,
                fontsize: 17,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
                textOverflow: TextOverflow.clip,
                height: 0.0,
              ),
              trailing: InkWell(
                onTap: () => Get.to(() => SearchView()),
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
                    Icons.search_outlined,
                    color: ColorSelect.blackColor,
                    size: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.9049,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: ColorSelect.whiteColor,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 210,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(ImagesPath.man),
                                fit: BoxFit.fill),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 35, top: 35),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Men',
                                  color: ColorSelect.TextMen,
                                  fontsize: 34,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w400,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                                CustomText(
                                  text: '${dioMethods.man.length}K products',
                                  color: ColorSelect.TextDisCatigore,
                                  fontsize: 16,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w400,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                CustomBottonViewAll(
                                  text: 'View all',
                                  width: 110,
                                  height: 35,
                                  fontWeight: FontWeight.w600,
                                  function: () => Get.to(() => ManSupCategoryView()),
                                  color: ColorSelect.whiteColor,
                                  backgroundcolor: ColorSelect.TextMenButton,
                                  textAlign: TextAlign.left,
                                  fontsize: 14,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 210,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(ImagesPath.woman),
                                fit: BoxFit.fill),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 35, top: 35),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Women',
                                  color: ColorSelect.TextWomen,
                                  fontsize: 34,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w400,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                                CustomText(
                                  text: '${dioMethods.women.length}K products',
                                  color: ColorSelect.TextDisCatigore,
                                  fontsize: 16,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w400,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                CustomBottonViewAll(
                                  text: 'View all',
                                  width: 110,
                                  height: 35,
                                  fontWeight: FontWeight.w600,
                                  function: () => Get.to(() => WomenSupCategoryView()),
                                  color: ColorSelect.whiteColor,
                                  backgroundcolor: ColorSelect.TextWomenButton,
                                  textAlign: TextAlign.left,
                                  fontsize: 14,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 210,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(ImagesPath.kid),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 35, top: 35),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Kids',
                                  color: ColorSelect.TextKid,
                                  fontsize: 34,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w400,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                                CustomText(
                                  text: '${dioMethods.kid.length}K products',
                                  color: ColorSelect.TextDisCatigore,
                                  fontsize: 16,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w400,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                CustomBottonViewAll(
                                  text: 'View all',
                                  width: 110,
                                  height: 35,
                                  fontWeight: FontWeight.w600,
                                  function: () => Get.to(() => KidSupCategoryView()),
                                  color: ColorSelect.whiteColor,
                                  backgroundcolor: ColorSelect.TextKidButton,
                                  textAlign: TextAlign.left,
                                  fontsize: 14,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 90,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(ImagesPath.ads),
                                fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomListTail(
                          name: 'Clothing',
                          svg: SvgsPath.Tshirt,
                          trailing: () => Get.to(
                            () => ClothingView(),
                          ),
                          listTile: () => Get.to(
                            () => ClothingView(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomListTail(
                          name: 'Shoes',
                          svg: SvgsPath.shoes,
                          trailing: () => Get.to(
                            () => ShoesView(),
                          ),
                          listTile: () => Get.to(
                            () => ShoesView(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomListTail(
                          name: 'Furniture',
                          svg: SvgsPath.furniture,
                          trailing: () => Get.to(
                            () => FurnitureView(),
                          ),
                          listTile: () => Get.to(
                            () => FurnitureView(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomListTail(
                          name: 'Electronics',
                          svg: SvgsPath.electronics,
                          trailing: () => Get.to(
                            () => ElectronicsView(),
                          ),
                          listTile: () => Get.to(
                            () => ElectronicsView(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomListTail(
                          name: 'Others',
                          svg: SvgsPath.light,
                          trailing: () => Get.to(
                            () => OthersView(),
                          ),
                          listTile: () => Get.to(
                            () => OthersView(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
