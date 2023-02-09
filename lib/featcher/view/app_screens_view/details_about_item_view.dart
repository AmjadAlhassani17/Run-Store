// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/core/path/svgs_path.dart';
import 'package:runstore/featcher/model/product_data_model.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import 'package:runstore/featcher/view_model/details_size_item_view_model.dart';
import 'package:runstore/featcher/view_model/shopping_view-model.dart';
import 'package:runstore/utils/locale/language_all.dart';
import '../../../utils/utils.dart';
import '../../model/cart_product_model.dart';
import '../../view_model/cart_view_model.dart';
import '../widgets/custom_add_cart.dart';
import '../widgets/custom_price_with_line.dart';

class DetailsAboutItemView extends StatefulWidget {
  DetailsAboutItemView({Key? key, required this.productData}) : super(key: key);
  static final DetailsSizeItemViewModel detailsSizeItemViewModel =
      Get.put(DetailsSizeItemViewModel(), permanent: true);
  static final CartViewModel cartViewModel =
      Get.put(CartViewModel(), permanent: true);

  static final ShoppingViewModel shoppingViewModel =
      Get.put(ShoppingViewModel(), permanent: true);
  ProductData productData;

  @override
  State<DetailsAboutItemView> createState() => _DetailsAboutItemViewState();
}

class _DetailsAboutItemViewState extends State<DetailsAboutItemView> {
  int item = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DetailsSizeItemViewModel>(
          init: DetailsSizeItemViewModel(),
          builder: (controller) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              color: ColorSelect.scaffoldBackgroundColorCatagories,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  ListTile(
                    leading: InkWell(
                      onTap: () {},
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
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: ColorSelect.primarycolor,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    title: CustomText(
                      text: '${widget.productData.title}',
                      color: ColorSelect.textColor,
                      fontsize: 17,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      textOverflow: TextOverflow.ellipsis,
                      height: 0.0,
                    ),
                    trailing: GetBuilder<CartViewModel>(
                        init: CartViewModel(),
                        builder: (controller2) {
                          return FutureBuilder<bool>(
                              future:
                                  controller2.getProduct(widget.productData.id),
                              builder: (context, snapshot) {
                                return InkWell(
                                  onTap: () {
                                    if (snapshot.data == true) {
                                      controller2
                                          .deleteProduct(widget.productData.id);
                                      setState(() {});
                                    } else {
                                      controller2.addProduct(
                                        CartProduct(
                                          title: widget.productData.title,
                                          description:
                                              widget.productData.description,
                                          image:
                                              widget.productData.images.first,
                                          price: widget.productData.price,
                                          id: widget.productData.id,
                                        ),
                                      );
                                      setState(() {});
                                    }
                                  },
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
                                      snapshot.data == true
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: ColorSelect.primarycolor,
                                      size: 30,
                                    ),
                                  ),
                                );
                              });
                        }),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.8810,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorSelect.whiteColor),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: ColorSelect.whiteColor,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 340,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Utils.instance.networkImage(
                                  imageUrl: controller.size == 1
                                      ? widget.productData.images.first
                                      : controller.size == 2
                                          ? widget.productData.images[1]
                                          : controller.size == 3
                                              ? widget.productData.images[2]
                                              : "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: widget.productData.category.name,
                                    color: ColorSelect.textColor,
                                    fontsize: 17,
                                    textAlign: TextAlign.right,
                                    fontWeight: FontWeight.w600,
                                    textOverflow: TextOverflow.ellipsis,
                                    height: 0.0,
                                  ),
                                  CustomText(
                                    text: '\$${widget.productData.price}',
                                    color: ColorSelect.primarycolor,
                                    fontsize: 17,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w600,
                                    textOverflow: TextOverflow.ellipsis,
                                    height: 0.0,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: widget.productData.title,
                                    color: ColorSelect.textColor,
                                    fontsize: 17,
                                    textAlign: TextAlign.right,
                                    fontWeight: FontWeight.w600,
                                    textOverflow: TextOverflow.ellipsis,
                                    height: 0.0,
                                  ),
                                  CustomPriceWithLine(
                                    text: '\$${widget.productData.price + 56}',
                                    color: ColorSelect.PriceNewArrival,
                                    fontsize: 17,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w600,
                                    textOverflow: TextOverflow.ellipsis,
                                    height: 0.0,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Visibility(
                                visible: widget.productData.category.name ==
                                    'Clothes',
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        item = 1;
                                        controller.changeSize(lenght: item);
                                      },
                                      child: Container(
                                        height: 48,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorSelect.primarycolor),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                          color: controller.size == 1
                                              ? ColorSelect.primarycolor
                                              : ColorSelect.whiteColor,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              text: 'S',
                                              color: controller.size == 1
                                                  ? ColorSelect.whiteColor
                                                  : ColorSelect.primarycolor,
                                              fontsize: 20,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w600,
                                              textOverflow: TextOverflow.clip,
                                              height: 0.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        item = 2;
                                        controller.changeSize(lenght: item);
                                      },
                                      child: Container(
                                        height: 48,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorSelect.primarycolor),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                          color: controller.size == 2
                                              ? ColorSelect.primarycolor
                                              : ColorSelect.whiteColor,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              text: 'M',
                                              color: controller.size == 2
                                                  ? ColorSelect.whiteColor
                                                  : ColorSelect.primarycolor,
                                              fontsize: 20,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w600,
                                              textOverflow: TextOverflow.clip,
                                              height: 0.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        item = 3;
                                        controller.changeSize(lenght: item);
                                      },
                                      child: Container(
                                        height: 48,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorSelect.primarycolor),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                          color: controller.size == 3
                                              ? ColorSelect.primarycolor
                                              : ColorSelect.whiteColor,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              text: 'L',
                                              color: controller.size == 3
                                                  ? ColorSelect.whiteColor
                                                  : ColorSelect.primarycolor,
                                              fontsize: 20,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w600,
                                              textOverflow: TextOverflow.clip,
                                              height: 0.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible:
                                    widget.productData.category.name == 'Shoes',
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        item = 1;
                                        controller.changeSize(lenght: item);
                                      },
                                      child: Container(
                                        height: 48,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorSelect.primarycolor),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                          color: controller.size == 1
                                              ? ColorSelect.primarycolor
                                              : ColorSelect.whiteColor,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              text: '38',
                                              color: controller.size == 1
                                                  ? ColorSelect.whiteColor
                                                  : ColorSelect.primarycolor,
                                              fontsize: 20,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w600,
                                              textOverflow: TextOverflow.clip,
                                              height: 0.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        item = 2;
                                        controller.changeSize(lenght: item);
                                      },
                                      child: Container(
                                        height: 48,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorSelect.primarycolor),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                          color: controller.size == 2
                                              ? ColorSelect.primarycolor
                                              : ColorSelect.whiteColor,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              text: '42',
                                              color: controller.size == 2
                                                  ? ColorSelect.whiteColor
                                                  : ColorSelect.primarycolor,
                                              fontsize: 20,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w600,
                                              textOverflow: TextOverflow.clip,
                                              height: 0.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        item = 3;
                                        controller.changeSize(lenght: item);
                                      },
                                      child: Container(
                                        height: 48,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorSelect.primarycolor),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                          color: controller.size == 3
                                              ? ColorSelect.primarycolor
                                              : ColorSelect.whiteColor,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              text: '45',
                                              color: controller.size == 3
                                                  ? ColorSelect.whiteColor
                                                  : ColorSelect.primarycolor,
                                              fontsize: 20,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w600,
                                              textOverflow: TextOverflow.clip,
                                              height: 0.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              GetBuilder<ShoppingViewModel>(
                                  init: ShoppingViewModel(),
                                  builder: (controller) {
                                    return FutureBuilder<bool>(
                                        future: controller
                                            .getProduct(widget.productData.id),
                                        builder: (context, snapshot) {
                                          return CustomAddCart(
                                            text: StringKey.addCart.tr,
                                            image: SvgsPath.cart,
                                            width: double.infinity,
                                            height: 48,
                                            fontWeight: FontWeight.w600,
                                            function: () {
                                              controller.addProduct(
                                                CartProduct(
                                                  title:
                                                      widget.productData.title,
                                                  description: widget
                                                      .productData.description,
                                                  image: widget
                                                      .productData.images.first,
                                                  price:
                                                      widget.productData.price,
                                                  id: widget.productData.id,
                                                ),
                                              );
                                              setState(() {});
                                            },
                                            color: ColorSelect.whiteColor,
                                            backgroundcolor:
                                                ColorSelect.primarycolor,
                                            textAlign: TextAlign.center,
                                            fontsize: 17,
                                          );
                                        });
                                  }),
                              const SizedBox(
                                height: 28,
                              ),
                              ListTile(
                                leading: Container(
                                  padding: EdgeInsets.all(12),
                                  height: 48,
                                  width: 48,
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    color: ColorSelect.iconPerson,
                                  ),
                                  child: SvgPicture.asset(
                                    SvgsPath.star,
                                    color: ColorSelect.primarycolor,
                                  ),
                                ),
                                title: CustomText(
                                  text: '5.0',
                                  color: ColorSelect.textColor,
                                  fontsize: 17,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w600,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                              ),
                              const SizedBox(
                                height: 28,
                              ),
                              ExpansionTile(
                                leading: Container(
                                  padding: EdgeInsets.all(12),
                                  height: 48,
                                  width: 48,
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    color: ColorSelect.iconPerson,
                                  ),
                                  child: SvgPicture.asset(
                                    SvgsPath.book,
                                    color: ColorSelect.primarycolor,
                                  ),
                                ),
                                title: CustomText(
                                  text: StringKey.aboutBrand.tr,
                                  color: ColorSelect.textColor,
                                  fontsize: 17,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w600,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                                trailing: Container(
                                  padding: EdgeInsets.all(12),
                                  height: 48,
                                  width: 48,
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    color: ColorSelect.iconPerson,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      controller.customTileExpanded
                                          ? Icons.remove
                                          : Icons.add,
                                      color: ColorSelect.primarycolor,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: CustomText(
                                      text: widget.productData.description,
                                      color: ColorSelect.TextNewArrival,
                                      fontsize: 17,
                                      textAlign: TextAlign.left,
                                      fontWeight: FontWeight.w300,
                                      textOverflow: TextOverflow.clip,
                                      height: 0.0,
                                    ),
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  controller.changeStateExpanded(expanded);
                                },
                              ),
                              const SizedBox(
                                height: 28,
                              ),
                              ExpansionTile(
                                leading: Container(
                                  padding: EdgeInsets.all(12),
                                  height: 48,
                                  width: 48,
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    color: ColorSelect.iconPerson,
                                  ),
                                  child: SvgPicture.asset(
                                    SvgsPath.shipping,
                                    color: ColorSelect.primarycolor,
                                  ),
                                ),
                                title: CustomText(
                                  text: StringKey.shipping.tr,
                                  color: ColorSelect.textColor,
                                  fontsize: 17,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w600,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                                trailing: Container(
                                  padding: EdgeInsets.all(12),
                                  height: 48,
                                  width: 48,
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    color: ColorSelect.iconPerson,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      controller.customTileExpanded2
                                          ? Icons.remove
                                          : Icons.add,
                                      color: ColorSelect.primarycolor,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: CustomText(
                                      text:
                                          'Orders are delivered on business days excluding public holidays. We do not deliver on Sundays or holidays.',
                                      color: ColorSelect.TextNewArrival,
                                      fontsize: 17,
                                      textAlign: TextAlign.left,
                                      fontWeight: FontWeight.w300,
                                      textOverflow: TextOverflow.clip,
                                      height: 0.0,
                                    ),
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  controller.changeStateExpanded2(expanded);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
