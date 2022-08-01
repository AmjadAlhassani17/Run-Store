import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_fatoorah/my_fatoorah.dart';
import 'package:runstore/featcher/view/app_screens_view/cheack_out_views/body_view/address_view.dart';
import 'package:runstore/featcher/view/control.dart';
import 'package:runstore/featcher/view/widgets/custom_button.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import 'package:runstore/utils/locale/language_all.dart';
import '../../../../../utils/utils.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/path/svgs_path.dart';
import '../../../../model/product_data_model.dart';
import '../../../../view_model/check_out_view_model.dart';
import '../../../../view_model/shopping_view-model.dart';
import '../../details_about_item_view.dart';
import '../../shopping_view.dart';

class ConfirmView extends StatefulWidget {
  const ConfirmView({Key? key}) : super(key: key);
  static final CheckOutViewModel checkOutViewModel =
      Get.find<CheckOutViewModel>();
  static final ShoppingViewModel shoppingViewModel =
      Get.find<ShoppingViewModel>();

  @override
  State<ConfirmView> createState() => _ConfirmViewState();
}

class _ConfirmViewState extends State<ConfirmView> {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                GetBuilder<ShoppingViewModel>(
                  init: ShoppingViewModel(),
                  builder: (controller) {
                    return Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      height: MediaQuery.of(context).size.height * 0.45,
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
                                text: StringKey.inYourCart.tr,
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
                              itemBuilder: (BuildContext context, int index) {
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
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                          ),
                                          child: Utils.instance.networkImage(
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
                                                color: ColorSelect.textColor,
                                                fontsize: 16,
                                                textAlign: TextAlign.left,
                                                fontWeight: FontWeight.w400,
                                                textOverflow: TextOverflow.clip,
                                                height: 0.0,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              CustomText(
                                                text:
                                                    ' ${controller.cart.elementAt(index).description}',
                                                color:
                                                    ColorSelect.TextNewArrival,
                                                fontsize: 16,
                                                textAlign: TextAlign.left,
                                                fontWeight: FontWeight.w400,
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
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 20,
                                );
                              },
                              itemCount: controller.cart.length,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    thickness: 2,
                    color: ColorSelect.iconPerson,
                  ),
                ),
                SizedBox(
                  height: 20,
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
                      SvgsPath.shipping,
                      color: ColorSelect.primarycolor,
                    ),
                  ),
                  title: CustomText(
                    text: StringKey.delivery.tr,
                    color: ColorSelect.textColor,
                    fontsize: 17,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w600,
                    textOverflow: TextOverflow.clip,
                    height: 0.0,
                  ),
                  trailing: GetBuilder<CheckOutViewModel>(
                      init: CheckOutViewModel(),
                      builder: (controller) {
                        return CustomText(
                          text: controller.statePrice == 0
                              ? '+ \$0.00'
                              : controller.statePrice == 1
                                  ? '+ \$2.50'
                                  : controller.statePrice == 2
                                      ? '+ \$5.99'
                                      : '',
                          color: ColorSelect.textColor,
                          fontsize: 16,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w400,
                          textOverflow: TextOverflow.ellipsis,
                          height: 0.0,
                        );
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          '${AddressView.name.text}, ${AddressView.address.text}, ${AddressView.city.text}, ${AddressView.state.text}, ${AddressView.zip.text},',
                          style: TextStyle(
                            color: ColorSelect.TextNewArrival,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 0.0,
                          ),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip,
                          maxLines: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorSelect.scaffoldBackgroundColorCatagories),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: GetBuilder<CheckOutViewModel>(
                            init: CheckOutViewModel(),
                            builder: (controller) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: controller.statePrice == 0
                                        ? StringKey.free.tr
                                        : controller.statePrice == 1
                                            ? StringKey.standard.tr
                                            : controller.statePrice == 2
                                                ? StringKey.express.tr
                                                : '',
                                    color: ColorSelect.textColor,
                                    fontsize: 16,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w400,
                                    textOverflow: TextOverflow.clip,
                                    height: 0.0,
                                  ),
                                  CustomText(
                                    text: controller.statePrice == 0
                                        ? '3-5 ${StringKey.dayDelivery.tr}'
                                        : controller.statePrice == 1
                                            ? '2-3 ${StringKey.dayDelivery.tr}'
                                            : controller.statePrice == 2
                                                ? '${StringKey.next.tr} ${StringKey.dayDelivery.tr}'
                                                : '',
                                    color: ColorSelect.TextNewArrival,
                                    fontsize: 16,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w400,
                                    textOverflow: TextOverflow.clip,
                                    height: 0.0,
                                  )
                                ],
                              );
                            }),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GetBuilder<CheckOutViewModel>(
                  init: CheckOutViewModel(),
                  builder: (controller) {
                    return Container(
                      height: 170,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03,
                          bottom: MediaQuery.of(context).size.height * 0.05),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: ColorSelect.scaffoldBackgroundColorCatagories,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomText(
                                  text: StringKey.total.tr,
                                  color: ColorSelect.textColor,
                                  fontsize: 17,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w400,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                                GetBuilder<ShoppingViewModel>(
                                    init: ShoppingViewModel(),
                                    builder: (context) {
                                      return CustomText(
                                        text: '\$${context.totalPrice}',
                                        color: ColorSelect.textColor,
                                        fontsize: 17,
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.w400,
                                        textOverflow: TextOverflow.clip,
                                        height: 0.0,
                                      );
                                    },),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GetBuilder<ShoppingViewModel>(
                              init: ShoppingViewModel(),
                              builder: (logic) {
                                return CustomBotton(
                                  text: StringKey.ordernow.tr,
                                  width: double.infinity,
                                  height: 48,
                                  fontWeight: FontWeight.w600,
                                  function: () async {
                                    logic.getTotalPrice() != 0 ? pay() : Get.to(() => ControlView()) ; 
                                    logic.cart.clear();
                                    controller.changeStateCheckOut(index: 0);              
                                  },
                                  color: ColorSelect.whiteColor,
                                  backgroundcolor: ColorSelect.primarycolor,
                                  textAlign: TextAlign.center,
                                  fontsize: 17,
                                );
                              }
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pay() async {
    var response = await MyFatoorah.startPayment(
      context: context,
      request: MyfatoorahRequest.test(
        currencyIso: Country.SaudiArabia,
        // successUrl: 'https://openjournalsystems.com/file/2017/07/payment-success.png',
        successUrl:
            'https://dreyad-academy.brilliantartjo.com/wp-content/uploads/2022/05/Paymentsuccessful21.png',
        errorUrl: 'https://www.google.com/',
        invoiceAmount: 100,
        language: ApiLanguage.English,
        token:
            'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL',
      ),
    );
    log(response.paymentId.toString());
    log(response.status.toString());
    Get.to(() => ControlView());
  }
}
