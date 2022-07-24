import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import '../../../../utils/utils.dart';
import '../../../core/colors/colors.dart';
import '../../../model/cart_product_model.dart';
import '../../../view_model/cart_view_model.dart';
import '../../../view_model/dio_method_view_model.dart';
import '../../widgets/custom_price_with_line.dart';

class KidView extends StatefulWidget {
  const KidView({Key? key}) : super(key: key);

  static final DioMethods dioMethods = Get.put(DioMethods(), permanent: true);
  static final CartViewModel cartViewModel =
      Get.put(CartViewModel(), permanent: true);

  @override
  State<KidView> createState() => _KidViewState();
}

class _KidViewState extends State<KidView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 120) / 2;
    final double itemWidth = size.width / 2;
    print(KidView.dioMethods.kid.length);
    return Scaffold(
      backgroundColor: ColorSelect.scaffoldBackgroundColorCatagories,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
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
                  if (KidView.dioMethods.kid.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
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
                    itemCount: KidView.dioMethods.kid.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {},
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
                                          imageUrl: KidView.dioMethods.kid
                                              .elementAt(index)
                                              .images
                                              .first,
                                          fit: BoxFit.fill),
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
                                                  KidView.dioMethods.kid
                                                      .elementAt(index)
                                                      .id),
                                              builder: (context, snapshot) {
                                                print(
                                                    "MSG_SNAPSHOT_DATA ${snapshot.data}");
                                                return InkWell(
                                                  onTap: () {
                                                    print(
                                                        controller.cart.length);
                                                    if (snapshot.data ??
                                                        false) {
                                                      
                                                      setState(() {
                                                        controller
                                                          .deleteProduct(KidView.dioMethods.kid
                                                      .elementAt(index)
                                                      .id);
                                                      });
                                                    } else {
                                                      
                                                      setState(() {
                                                        controller.addProduct(
                                                        CartProduct(
                                                          title: KidView
                                                              .dioMethods.kid
                                                              .elementAt(index)
                                                              .title,
                                                          description: KidView
                                                              .dioMethods.kid
                                                              .elementAt(index)
                                                              .description,
                                                          image: KidView
                                                              .dioMethods.kid
                                                              .elementAt(index)
                                                              .images
                                                              .first,
                                                          price: KidView
                                                              .dioMethods.kid
                                                              .elementAt(index)
                                                              .price,
                                                          id: KidView
                                                              .dioMethods.kid
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
                                                      color: ColorSelect
                                                          .transparent,
                                                    ),
                                                    child: Icon(
                                                      snapshot.data == true
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_outline,
                                                      color: ColorSelect
                                                          .primarycolor,
                                                      size: 25,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  text: KidView.dioMethods.kid
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
                                  text: KidView.dioMethods.kid
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text:
                                          '\$${KidView.dioMethods.kid.elementAt(index).price}',
                                      height: 0.0,
                                      textOverflow: TextOverflow.ellipsis,
                                      fontsize: 16,
                                      color: ColorSelect.primarycolor,
                                      fontWeight: FontWeight.w100,
                                      textAlign: TextAlign.left,
                                    ),
                                    
                                    CustomPriceWithLine(
                                      text:
                                          '\$${KidView.dioMethods.kid.elementAt(index).price + 56}',
                                      height: 0.0,
                                      textOverflow: TextOverflow.ellipsis,
                                      fontsize: 16,
                                      color: ColorSelect.PriceNewArrival,
                                      fontWeight: FontWeight.w100,
                                      textAlign: TextAlign.left,
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
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
