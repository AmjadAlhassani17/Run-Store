// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/core/path/svgs_path.dart';
import 'package:runstore/featcher/model/product_data_model.dart';
import 'package:runstore/featcher/view/widgets/custom_price_with_line.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import 'package:runstore/featcher/view_model/cart_view_model.dart';
import 'package:runstore/featcher/view_model/dio_method_view_model.dart';
import '../../../../../utils/utils.dart';
import '../../../model/cart_product_model.dart';
import '../../../view_model/shopping_view-model.dart';
import '../details_about_item_view.dart';

class AllProductSearchView extends StatefulWidget {
  AllProductSearchView({Key? key}) : super(key: key);

  static final DioMethods dioMethods = Get.put(DioMethods(), permanent: true);
  static final CartViewModel cartViewModel = Get.find<CartViewModel>();
  static final ShoppingViewModel shoppingViewModel = Get.find<ShoppingViewModel>();

  static Set<ProductData> display_list =
      Set.from(AllProductSearchView.dioMethods.products);

  @override
  State<AllProductSearchView> createState() => _AllProductSearchViewState();
}

class _AllProductSearchViewState extends State<AllProductSearchView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 120) / 2;
    final double itemWidth = size.width / 2;
    print(AllProductSearchView.display_list.length);
    return Scaffold(
      backgroundColor: ColorSelect.scaffoldBackgroundColorCatagories,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: ColorSelect.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<DioMethods>(builder: (controller) {
                  if (AllProductSearchView.display_list.isEmpty) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.15),
                            child: SvgPicture.asset(
                              SvgsPath.emptySearch,
                              height: 200,
                              width: 200,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    builder: (controller) {
                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 280,
                          childAspectRatio: (itemWidth / itemHeight),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 15,
                        ),
                        itemCount: AllProductSearchView.display_list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => DetailsAboutItemView(
                                  productData: AllProductSearchView.display_list
                                      .elementAt(index)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: ColorSelect.whiteColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: ColorSelect.whiteColor,
                              ),
                              width: 160,
                              height: 240,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 190,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: Utils.instance.networkImage(
                                              imageUrl: AllProductSearchView
                                                  .display_list
                                                  .elementAt(index)
                                                  .images
                                                  .first,
                                              fit: BoxFit.fill),
                                        ),
                                        Positioned(
                                            top: 5,
                                            right:
                                                MediaQuery.of(context).size.width *
                                                    0.02,
                                            child: FutureBuilder<bool>(
                                              future: controller.getProduct(AllProductSearchView
                                                  .display_list
                                                  .elementAt(index).id),
                                              builder: (context, snapshot) {
                                                print(
                                                    "MSG_SNAPSHOT_DATA ${snapshot.data}");
                                                return InkWell(
                                                  onTap: () {
                                                    print(controller.cart.length);
                                                    if (snapshot.data == true) {
                                                      
                                                        
                                                  setState(() {
                                                    controller.deleteProduct(AllProductSearchView
                                                  .display_list
                                                  .elementAt(index).id);
                                                  });
                                                      
                                                    } else {
                                                      
                                                      setState(() {
                                                        controller.addProduct(
                                                        CartProduct(
                                                          title: AllProductSearchView
                                                  .display_list
                                                  .elementAt(index).title,
                                                          description:
                                                              AllProductSearchView
                                                  .display_list
                                                  .elementAt(index).description,
                                                          image: AllProductSearchView
                                                  .display_list
                                                  .elementAt(index)
                                                              .images.first,
                                                          price: AllProductSearchView
                                                  .display_list
                                                  .elementAt(index).price,
                                                          id: AllProductSearchView
                                                  .display_list
                                                  .elementAt(index).id,
                                                        ),
                                                      );
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: 45,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: ColorSelect
                                                              .primarycolor),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(12),
                                                      ),
                                                      color:
                                                          ColorSelect.transparent,
                                                    ),
                                                    child: Icon(
                                                      snapshot.data == true
                                                          ? Icons.favorite
                                                          : Icons.favorite_outline,
                                                      color:
                                                          ColorSelect.primarycolor,
                                                      size: 25,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Positioned(
                                            top: 5,
                                            left:
                                                MediaQuery.of(context).size.width *
                                                    0.02,
                                            child: GetBuilder<ShoppingViewModel>(
                                              init: ShoppingViewModel(),
                                              builder: (controller2) {
                                                return FutureBuilder<bool>(
                                                  future: controller2.getProduct(
                                                       AllProductSearchView
                                                  .display_list
                                                  .elementAt(index)
                                                            .id),
                                                  builder: (context, snapshot) {
                                                    return InkWell(
                                                          onTap: () {
                                                            if (snapshot.data == true) {
                                                            controller2
                                                                .deleteProduct(
                                                                    AllProductSearchView
                                                  .display_list
                                                  .elementAt(index)
                                                            .id);
                                                            setState(() {});
                                                          } else {
                                                            controller2.addProduct(
                                                              CartProduct(
                                                                title: AllProductSearchView
                                                  .display_list
                                                  .elementAt(index)
                                                                    .title,
                                                                description: AllProductSearchView
                                                  .display_list
                                                  .elementAt(index)
                                                                    .description,
                                                                image: AllProductSearchView
                                                  .display_list
                                                  .elementAt(index)
                                                                    .images.first,
                                                                price: AllProductSearchView
                                                  .display_list
                                                  .elementAt(index)
                                                                    .price,
                                                                id: AllProductSearchView
                                                  .display_list
                                                  .elementAt(index)
                                                                    .id,
                                                              ),
                                                            );
                                                            setState(() {});
                                                          }
                                                          },
                                                          child: Container(
                                                            height: 45,
                                                            width: 45,
                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: ColorSelect
                                                                      .primarycolor),
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                Radius.circular(12),
                                                              ),
                                                              color:
                                                                  ColorSelect.transparent,
                                                            ),
                                                            child: Icon(
                                                              snapshot.data == true ? Icons.shopping_cart :
                                                                Icons.shopping_cart_outlined,
                                                              color:
                                                                  ColorSelect.primarycolor,
                                                              size: 25,
                                                            ),
                                                          ),
                                                        );
                                                  }
                                                );
                                              }
                                            )
                                              
                                          ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      text: AllProductSearchView.display_list
                                          .elementAt(index)
                                          .category
                                          .name,
                                      height: 0.0,
                                      textOverflow: TextOverflow.ellipsis,
                                      fontsize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w200,
                                      textAlign: TextAlign.left,
                                    ),
                                    CustomText(
                                      text: AllProductSearchView.display_list
                                          .elementAt(index)
                                          .title,
                                      height: 0.0,
                                      textOverflow: TextOverflow.ellipsis,
                                      fontsize: 16,
                                      color: ColorSelect.TextNewArrival,
                                      fontWeight: FontWeight.w200,
                                      textAlign: TextAlign.left,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text:
                                              '\$${AllProductSearchView.display_list.elementAt(index).price}',
                                          height: 0.0,
                                          textOverflow: TextOverflow.ellipsis,
                                          fontsize: 16,
                                          color: ColorSelect.primarycolor,
                                          fontWeight: FontWeight.w100,
                                          textAlign: TextAlign.center,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width *
                                              0.15,
                                          child: CustomPriceWithLine(
                                            text:
                                                '\$${AllProductSearchView.display_list.elementAt(index).price + 56}',
                                            height: 0.0,
                                            textOverflow: TextOverflow.ellipsis,
                                            fontsize: 16,
                                            color: ColorSelect.PriceNewArrival,
                                            fontWeight: FontWeight.w100,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
