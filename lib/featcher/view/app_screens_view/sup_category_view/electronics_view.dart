import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import 'package:runstore/featcher/view_model/cart_view_model.dart';
import 'package:runstore/featcher/view_model/dio_method_view_model.dart';
import 'package:runstore/featcher/view_model/shopping_view-model.dart';
import '../../../../utils/utils.dart';
import '../../../model/cart_product_model.dart';
import '../../widgets/custom_price_with_line.dart';
import '../details_about_item_view.dart';

class ElectronicsView extends StatefulWidget {
  const ElectronicsView({Key? key}) : super(key: key);
  static final DioMethods dioMethods = Get.put(DioMethods(), permanent: true);
  static final CartViewModel cartViewModel =
      Get.put(CartViewModel(), permanent: true);
  static final ShoppingViewModel shoppingViewModel = Get.put(ShoppingViewModel(),permanent: true);
  @override
  State<ElectronicsView> createState() => _ElectronicsViewState();
}

class _ElectronicsViewState extends State<ElectronicsView> {
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
                      color: ColorSelect.blackColor,
                      size: 25,
                    ),
                  ),
                ),
              ),
              title: CustomText(
                text: 'Category',
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
              height: 24,
            ),
            CustomText(
              text: ElectronicsView.dioMethods.electronics
                  .elementAt(0)
                  .category
                  .name,
              color: ColorSelect.textColor,
              fontsize: 34,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              textOverflow: TextOverflow.clip,
              height: 0.0,
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8211,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: ColorSelect.whiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      if (ElectronicsView.dioMethods.electronics.isEmpty) {
                        return Center(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      return InkWell(
                        onTap: () {
                          Get.to(() => DetailsAboutItemView(productData : ElectronicsView.dioMethods.electronics
                                                .elementAt(index)));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 275,
                          color: ColorSelect.whiteColor,
                          child: Column(
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
                                      imageUrl: ElectronicsView
                                          .dioMethods.electronics
                                          .elementAt(index)
                                          .images[0],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: MediaQuery.of(context).size.width *
                                        0.02,
                                    child: GetBuilder<CartViewModel>(
                                      init: CartViewModel(),
                                      builder: (controller) {
                                        return FutureBuilder<bool>(
                                          future: controller.getProduct(
                                              ElectronicsView
                                                  .dioMethods.electronics
                                                  .elementAt(index)
                                                  .id),
                                          builder: (context, snapshot) {
                                            print(
                                                "MSG_SNAPSHOT_DATA ${snapshot.data}");
                                            return InkWell(
                                              onTap: () {
                                                print(controller.cart.length);
                                                if (snapshot.data ?? false) {
                                                  
                                                  setState(() {
                                                    controller
                                                      .deleteProduct(ElectronicsView
                                                  .dioMethods.electronics
                                                  .elementAt(index)
                                                  .id);
                                                  });
                                                } else {
                                                  
                                                  setState(() {
                                                    controller.addProduct(
                                                    CartProduct(
                                                      title: ElectronicsView
                                                          .dioMethods
                                                          .electronics
                                                          .elementAt(index)
                                                          .title,
                                                      description:
                                                          ElectronicsView
                                                              .dioMethods
                                                              .electronics
                                                              .elementAt(index)
                                                              .description,
                                                      image: ElectronicsView
                                                          .dioMethods
                                                          .electronics
                                                          .elementAt(index)
                                                          .images
                                                          .first,
                                                      price: ElectronicsView
                                                          .dioMethods
                                                          .electronics
                                                          .elementAt(index)
                                                          .price,
                                                      id: ElectronicsView
                                                          .dioMethods
                                                          .electronics
                                                          .elementAt(index)
                                                          .id,
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
                                                   ElectronicsView
                                                          .dioMethods
                                                          .electronics
                                                          .elementAt(index)
                                                        .id),
                                              builder: (context, snapshot) {
                                                return InkWell(
                                                      onTap: () {
                                                        if (snapshot.data == true) {
                                                        controller2
                                                            .deleteProduct(
                                                                ElectronicsView
                                                          .dioMethods
                                                          .electronics
                                                          .elementAt(index)
                                                        .id);
                                                        setState(() {});
                                                      } else {
                                                        controller2.addProduct(
                                                          CartProduct(
                                                            title: ElectronicsView
                                                          .dioMethods
                                                          .electronics
                                                          .elementAt(index)
                                                                .title,
                                                            description: ElectronicsView
                                                          .dioMethods
                                                          .electronics
                                                          .elementAt(index)
                                                                .description,
                                                            image: ElectronicsView
                                                          .dioMethods
                                                          .electronics
                                                          .elementAt(index)
                                                                .images.first,
                                                            price: ElectronicsView
                                                          .dioMethods
                                                          .electronics
                                                          .elementAt(index)
                                                                .price,
                                                            id: ElectronicsView
                                                          .dioMethods
                                                          .electronics
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
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 5, left: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: ElectronicsView
                                          .dioMethods.electronics
                                          .elementAt(index)
                                          .category
                                          .name,
                                      color: ColorSelect.textColor,
                                      fontsize: 16,
                                      textAlign: TextAlign.left,
                                      fontWeight: FontWeight.w400,
                                      textOverflow: TextOverflow.clip,
                                      height: 0.0,
                                    ),
                                    CustomText(
                                      text:
                                          '\$${ElectronicsView.dioMethods.electronics.elementAt(index).price}',
                                      color: ColorSelect.primarycolor,
                                      fontsize: 16,
                                      textAlign: TextAlign.right,
                                      fontWeight: FontWeight.w400,
                                      textOverflow: TextOverflow.clip,
                                      height: 0.0,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 5, left: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 250,
                                        child: CustomText(
                                          text: ElectronicsView
                                              .dioMethods.electronics
                                              .elementAt(index)
                                              .title,
                                          color: ColorSelect.TextNewArrival,
                                          fontsize: 16,
                                          textAlign: TextAlign.left,
                                          fontWeight: FontWeight.w400,
                                          textOverflow: TextOverflow.ellipsis,
                                          height: 0.0,
                                        )),
                                    CustomPriceWithLine(
                                      text:
                                          '\$${ElectronicsView.dioMethods.electronics.elementAt(index).price + 56}',
                                      color: ColorSelect.PriceNewArrival,
                                      fontsize: 13,
                                      textAlign: TextAlign.right,
                                      fontWeight: FontWeight.w400,
                                      textOverflow: TextOverflow.ellipsis,
                                      height: 0.0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: ElectronicsView.dioMethods.electronics.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
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
