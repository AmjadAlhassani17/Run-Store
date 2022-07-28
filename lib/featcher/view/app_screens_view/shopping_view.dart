import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/view/app_screens_view/sup_category_view/man_sup_category_view.dart';
import 'package:runstore/featcher/view/widgets/custom_button.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import '../../../utils/utils.dart';
import '../../core/path/svgs_path.dart';
import '../../model/product_data_model.dart';
import '../../view_model/dio_method_view_model.dart';
import '../../view_model/shopping_view-model.dart';
import 'cheack_out_views/check_out_view.dart';
import 'details_about_item_view.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({Key? key}) : super(key: key);

  static final ShoppingViewModel shoppingViewModel = Get.put(ShoppingViewModel(),permanent: true);
  static final DioMethods homeViewModel = Get.find<DioMethods>();

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingViewModel>(
        init: ShoppingViewModel(),
        builder: (controller) => controller.cart.isEmpty
            ? Scaffold(body: OrientationBuilder(
      builder: ((context, orientation) {
        if (orientation == Orientation.portrait) {
          return portraitModeEmpty(context);
        } else {
          return landscapeModeEmpty(context);
        }
      }),
    ),)
            : Scaffold(body: OrientationBuilder(
      builder: ((context, orientation) {
        if (orientation == Orientation.portrait) {
          return portraitMode(context);
        } else {
          return landscapeMode(context);
        }
      }),
    ),),);
  }

  Widget portraitMode(context) {
    return GetBuilder<ShoppingViewModel>(
      init: ShoppingViewModel(),
      builder: (controller) {
        return Container(
          // width: double.infinity,
          // height: double.infinity,
          color: ColorSelect.iconPerson,
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
              SizedBox(
                height: 35,
              ),
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      height: MediaQuery.of(context).size.height * 0.715,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45)),
                        color: ColorSelect.whiteColor,
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            ListTile(
                              trailing: CustomText(
                                text: '${controller.cart.length}',
                                color: ColorSelect.primarycolor,
                                fontsize: 17,
                                textAlign: TextAlign.right,
                                fontWeight: FontWeight.w600,
                                textOverflow: TextOverflow.ellipsis,
                                height: 0.0,
                              ),
                              title: CustomText(
                                text: 'In your cart',
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
                                child: SvgPicture.asset(
                                  SvgsPath.cart,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                            ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      print(controller.cart.length);
                                      return InkWell(
                                        onTap: () {
                                          int? productId = ShoppingView
                                              .shoppingViewModel.cart[index].id;
                                          ProductData productData = ShoppingView
                                              .homeViewModel.products
                                              .where((element) =>
                                                  element.id == productId)
                                              .first;

                                          Get.to(() => DetailsAboutItemView(
                                                productData: productData,
                                              ));
                                        },
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
                                                    controller.deleteProduct(
                                                        controller.cart
                                                                .elementAt(
                                                                    index)
                                                                .id ??
                                                            0);
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
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 20,
                                );
                              },
                              itemCount: controller.cart.length,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.12,
                      color: ColorSelect.whiteColor,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        height: MediaQuery.of(context).size.height * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45),
                          ),
                          color: ColorSelect.iconPerson,
                        ),
                        child: CustomBotton(
                          text: 'Go to checkout  - \$${controller.totalPrice}',
                          width: MediaQuery.of(context).size.width * 0.12,
                          height: 48,
                          fontWeight: FontWeight.w600,
                          function: () {
                            Get.to(() => CheckOutView());
                          },
                          color: ColorSelect.whiteColor,
                          backgroundcolor: ColorSelect.primarycolor,
                          textAlign: TextAlign.center,
                          fontsize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }

  Widget landscapeMode(BuildContext context) {
    return GetBuilder<ShoppingViewModel>(
      init: ShoppingViewModel(),
      builder: (controller) {
        return Container(
          // width: double.infinity,
          // height: double.infinity,
          color: ColorSelect.iconPerson,
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
              SizedBox(
                height: 5,
              ),
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45)),
                        color: ColorSelect.whiteColor,
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            ListTile(
                              trailing: CustomText(
                                text: '${controller.cart.length}',
                                color: ColorSelect.primarycolor,
                                fontsize: 17,
                                textAlign: TextAlign.right,
                                fontWeight: FontWeight.w600,
                                textOverflow: TextOverflow.ellipsis,
                                height: 0.0,
                              ),
                              title: CustomText(
                                text: 'In your cart',
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
                                child: SvgPicture.asset(
                                  SvgsPath.cart,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                            ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      print(controller.cart.length);
                                      return InkWell(
                                        onTap: () {
                                          int? productId = ShoppingView
                                              .shoppingViewModel.cart[index].id;
                                          ProductData productData = ShoppingView
                                              .homeViewModel.products
                                              .where((element) =>
                                                  element.id == productId)
                                              .first;

                                          Get.to(() => DetailsAboutItemView(
                                                productData: productData,
                                              ));
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 150,
                                          color: ColorSelect.whiteColor,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                    controller.deleteProduct(
                                                        controller.cart
                                                                .elementAt(
                                                                    index)
                                                                .id ??
                                                            0);
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
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 20,
                                );
                              },
                              itemCount: controller.cart.length,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
                      color: ColorSelect.whiteColor,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45),
                          ),
                          color: ColorSelect.iconPerson,
                        ),
                        child: CustomBotton(
                          text: 'Go to checkout  - \$${controller.totalPrice}',
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 48,
                          fontWeight: FontWeight.w600,
                          function: () {
                            Get.to(() => CheckOutView());
                          },
                          color: ColorSelect.whiteColor,
                          backgroundcolor: ColorSelect.primarycolor,
                          textAlign: TextAlign.center,
                          fontsize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }

  Widget portraitModeEmpty(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: double.infinity,
      color: ColorSelect.iconPerson,
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
          SizedBox(
            height: 35,
          ),
          Stack(
            children: [
              Positioned(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: MediaQuery.of(context).size.height * 0.715,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45)),
                    color: ColorSelect.whiteColor,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                                SvgsPath.emptyCart,
                                width: 200,
                                height: 200,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomText(
                                    height: 0.0,
                                    text: 'Cart Shopping Empty',
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
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: GetBuilder<ShoppingViewModel>(
                  init: ShoppingViewModel(),
                  builder: (controller) {
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.12,
                      color: ColorSelect.whiteColor,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        height: MediaQuery.of(context).size.height * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45),
                          ),
                          color: ColorSelect.iconPerson,
                        ),
                        child: CustomBotton(
                          text: 'Go to checkout  - \$${controller.totalPrice} ',
                          width: MediaQuery.of(context).size.width * 0.12,
                          height: 48,
                          fontWeight: FontWeight.w600,
                          function: () => Get.to(() => CheckOutView()),
                          color: ColorSelect.whiteColor,
                          backgroundcolor: ColorSelect.primarycolor,
                          textAlign: TextAlign.center,
                          fontsize: 17,
                        ),
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget landscapeModeEmpty(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: double.infinity,
      color: ColorSelect.iconPerson,
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
          SizedBox(
            height: 5,
          ),
          Stack(
            children: [
              Positioned(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45)),
                    color: ColorSelect.whiteColor,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                                SvgsPath.emptyCart,
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
                                    text: 'Cart Shopping Empty',
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
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: GetBuilder<ShoppingViewModel>(
                  init: ShoppingViewModel(),
                  builder: (controller) {
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
                      color: ColorSelect.whiteColor,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45),
                          ),
                          color: ColorSelect.iconPerson,
                        ),
                        child: CustomBotton(
                          text: 'Go to checkout  - \$${controller.totalPrice}',
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: 48,
                          fontWeight: FontWeight.w600,
                          function: () {
                            Get.to(() => CheckOutView());
                          },
                          color: ColorSelect.whiteColor,
                          backgroundcolor: ColorSelect.primarycolor,
                          textAlign: TextAlign.center,
                          fontsize: 17,
                        ),
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
