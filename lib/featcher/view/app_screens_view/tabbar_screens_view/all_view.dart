import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/path/svgs_path.dart';
import 'package:runstore/featcher/model/product_data_model.dart';
import 'package:runstore/featcher/view/widgets/custom_price_with_line.dart';
import 'package:runstore/featcher/view_model/dio_method_view_model.dart';
import '../../../../utils/utils.dart';
import '../../../core/colors/colors.dart';
import '../../../core/path/images_path.dart';
import '../../widgets/custom_text.dart';

class AllView extends StatefulWidget {
  const AllView({Key? key}) : super(key: key);

  static final DioMethods dioMethods = Get.put(DioMethods(), permanent: true);

  @override
  State<AllView> createState() => _AllViewState();
}

class _AllViewState extends State<AllView> {
  @override
  void initState() {
    super.initState();
    AllView.dioMethods.getData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 120) / 2;
    final double itemWidth = size.width / 2;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        color: ColorSelect.whiteColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 220,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  ImagesPath.slider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              trailing: InkWell(
                onTap: () {},
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorSelect.primarycolor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: ColorSelect.whiteColor,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorSelect.primarycolor,
                    size: 20,
                  ),
                ),
              ),
              title: CustomText(
                text: 'New arrivals',
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
                  SvgsPath.fire,
                  fit: BoxFit.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GetBuilder<DioMethods>(builder: (context) {
                if (AllView.dioMethods.products.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  children: [
                    for (int i = 0; i < 9; i++) getGridView(index: i),
                  ],
                );
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              trailing: InkWell(
                onTap: () {},
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorSelect.primarycolor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: ColorSelect.whiteColor,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorSelect.primarycolor,
                    size: 20,
                  ),
                ),
              ),
              title: CustomText(
                text: 'Most popular',
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
                  SvgsPath.star,
                  fit: BoxFit.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GetBuilder<DioMethods>(builder: (controller) {
                if (AllView.dioMethods.products.isEmpty) {
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
                  itemCount: AllView.dioMethods.products.length > 2
                      ? 2
                      : AllView.dioMethods.products.length,
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
                                    imageUrl: AllView.dioMethods.products.elementAt(index+1)
                                        .category.image,
                                    fit: BoxFit.fill),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                text: AllView
                                    .dioMethods.products.elementAt(index+1).category.name,
                                height: 0.0,
                                textOverflow: TextOverflow.ellipsis,
                                fontsize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                                textAlign: TextAlign.left,
                              ),
                              CustomText(
                                text: AllView.dioMethods.products.elementAt(index+1).title,
                                height: 0.0,
                                textOverflow: TextOverflow.ellipsis,
                                fontsize: 16,
                                color: ColorSelect.TextNewArrival,
                                fontWeight: FontWeight.w200,
                                textAlign: TextAlign.left,
                              ),
                              Row(
                                children: [
                                  CustomText(
                                    text:
                                        '\$${AllView.dioMethods.products.elementAt(index+1).price}',
                                    height: 0.0,
                                    textOverflow: TextOverflow.ellipsis,
                                    fontsize: 16,
                                    color: ColorSelect.primarycolor,
                                    fontWeight: FontWeight.w100,
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                  CustomPriceWithLine(
                                    text:
                                        '\$${AllView.dioMethods.products.elementAt(index+1).price + 56}',
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
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  Widget getGridView({required int index}) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 120) / 2;
    final double itemWidth = size.width / 2;
    List<ProductData> data = [];
    if (index % 4 == 0) {
      data = AllView.dioMethods.products.toList()
          .sublist(index , index % 4 == 0 ? index + 2  : 0);
    }

    return data.isNotEmpty
        ? Column(
            children: [
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 280,
                  childAspectRatio: (itemWidth / itemHeight),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                ),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int idx) {
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
                                    imageUrl: data[idx].category.image,
                                    fit: BoxFit.fill)),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: data[idx].category.name,
                              height: 0.0,
                              textOverflow: TextOverflow.ellipsis,
                              fontsize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                              textAlign: TextAlign.left,
                            ),
                            CustomText(
                              text: data[idx].title,
                              height: 0.0,
                              textOverflow: TextOverflow.ellipsis,
                              fontsize: 16,
                              color: ColorSelect.TextNewArrival,
                              fontWeight: FontWeight.w200,
                              textAlign: TextAlign.left,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: '\$${data[idx].price}',
                                  height: 0.0,
                                  textOverflow: TextOverflow.ellipsis,
                                  fontsize: 16,
                                  color: ColorSelect.primarycolor,
                                  fontWeight: FontWeight.w100,
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  width: 35,
                                ),
                                CustomPriceWithLine(
                                  text: '\$${data[idx].price + 56}',
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
              ),
              index % 3 == 1
                  ? Container(
                      height: 90,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: ColorSelect.colorContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImagesPath.gift,
                              height: 22,
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: 'Free Shipping over \$49',
                                  color: ColorSelect.TextOneContainer,
                                  fontsize: 17,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w400,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                                CustomText(
                                  text: 'free returns and exchange',
                                  color: ColorSelect.TextTwoContainer,
                                  fontsize: 13,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w400,
                                  textOverflow: TextOverflow.clip,
                                  height: 0.0,
                                ),
                              ],
                            ),
                            Image.asset(
                              ImagesPath.gift,
                              height: 22,
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          )
        : const SizedBox();
  }
}
