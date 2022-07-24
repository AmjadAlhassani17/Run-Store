// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/core/path/svgs_path.dart';
import 'package:runstore/featcher/view/app_screens_view/sup_category_view/man_sup_category_view.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import 'package:runstore/featcher/view_model/cart_view_model.dart';
import 'package:runstore/utils/utils.dart';

class FavoriteView extends StatefulWidget {
  FavoriteView({Key? key}) : super(key: key);
  static final CartViewModel cartViewModel =
      Get.put(CartViewModel(), permanent: true);

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder: (controller) => controller.cart.isEmpty
            ? Container(
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
                        text: 'Wishlist',
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
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.9049,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          color: ColorSelect.whiteColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              SvgsPath.emptyFavorite,
                              width: 200,
                              height: 200,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  height: 0.0,
                                  text: 'Favorite empty',
                                  textOverflow: TextOverflow.clip,
                                  fontsize: 20,
                                  color: ColorSelect.primarycolor,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Scaffold(
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
                          text: 'Wishlist',
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
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
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.9049,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                            color: ColorSelect.whiteColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 20,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  trailing: CustomText(
                                    text: '${controller.cart.length}',
                                    color: ColorSelect.textColor,
                                    fontsize: 17,
                                    textAlign: TextAlign.right,
                                    fontWeight: FontWeight.w600,
                                    textOverflow: TextOverflow.clip,
                                    height: 0.0,
                                  ),
                                  title: CustomText(
                                    text: 'Products',
                                    color: ColorSelect.textColor,
                                    fontsize: 17,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w600,
                                    textOverflow: TextOverflow.clip,
                                    height: 0.0,
                                  ),
                                  leading: Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                        color: ColorSelect.iconPerson,
                                      ),
                                      child: Icon(
                                        Icons.favorite_outlined,
                                        color: ColorSelect.primarycolor,
                                      )),
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      print(controller.cart.length);
                                      return InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: double.infinity,
                                          height: 150,
                                          color: ColorSelect.whiteColor,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 120,
                                                height: 150,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(12),
                                                  ),
                                                ),
                                                child:
                                                    Utils.instance.networkImage(
                                                  imageUrl: controller.cart
                                                      .elementAt(index)
                                                      .image as String,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Container(
                                                height: 150,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                                color: ColorSelect.transparent,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      text:
                                                          '${controller.cart.elementAt(index).title}',
                                                      color:
                                                          ColorSelect.textColor,
                                                      fontsize: 16,
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      textOverflow:
                                                          TextOverflow.clip,
                                                      height: 0.0,
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          ' ${controller.cart.elementAt(index).description}',
                                                      color: ColorSelect
                                                          .TextNewArrival,
                                                      fontsize: 16,
                                                      textAlign: TextAlign.left,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      height: 0.0,
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          '\$${controller.cart.elementAt(index).price}',
                                                      color: ColorSelect
                                                          .primarycolor,
                                                      fontsize: 16,
                                                      textAlign:
                                                          TextAlign.right,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      textOverflow:
                                                          TextOverflow.clip,
                                                      height: 0.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  
                                                      setState(() {
                                                        controller
                                                      .deleteProduct(controller.cart.elementAt(index).id ?? 0);
                                                      });
                                                },
                                                child: Container(
                                                  height: 48,
                                                  width: 48,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(12),
                                                    ),
                                                    color:
                                                        ColorSelect.iconPerson,
                                                  ),
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: ColorSelect
                                                        .primarycolor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: controller.cart.length,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height: 20,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
