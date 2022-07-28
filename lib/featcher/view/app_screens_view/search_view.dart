// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/view/app_screens_view/search_sup_category_view/all_product_search.dart';
import 'package:runstore/featcher/view/app_screens_view/search_sup_category_view/kid_search.dart';
import 'package:runstore/featcher/view/app_screens_view/search_sup_category_view/man_search.dart';
import 'package:runstore/featcher/view/app_screens_view/search_sup_category_view/women_search.dart';
import 'package:runstore/featcher/view_model/search_view_model.dart';
import '../widgets/custom_text.dart';

class SearchView extends StatefulWidget {
  SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with TickerProviderStateMixin {
  static SearchViewModel searchViewModel =
      Get.put(SearchViewModel(), permanent: true);
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 4,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: ColorSelect.scaffoldBackgroundColorCatagories,
          child: GetBuilder<SearchViewModel>(
              init: SearchViewModel(),
              builder: (controller) {
                return Column(
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
                        text: 'Search result',
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.60,
                        child: TextFormField(
                          onChanged: (vlaue) {
                            if (tabController!.index == 0)
                              searchViewModel.onChangeSearch();
                            else if (tabController!.index == 1)
                              searchViewModel.onChangeSearchMan();
                            else if (tabController!.index == 2)
                              searchViewModel.onChangeSearchWomen();
                            else if (tabController!.index == 3)
                              searchViewModel.onChangeSearchKid();
                          },
                          textAlign: TextAlign.center,
                          cursorColor: ColorSelect.curserColor,
                          controller: controller.search,
                          obscureText: false,
                          cursorRadius: Radius.circular(35),
                          decoration: InputDecoration(
                            hintText: 'Clot hing',
                            hintStyle: TextStyle(
                              color: ColorSelect.unSelect,
                              fontSize: 20,
                              height: 1,
                              decorationColor: ColorSelect.transparent,
                              fontWeight: FontWeight.w400,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorSelect.primarycolor,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorSelect.primarycolor,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            color: ColorSelect.primarycolor,
                            fontSize: 20,
                            height: 1,
                            decorationColor: ColorSelect.transparent,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 45,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7893,
                        child: TabBar(
                          controller: tabController,
                          physics: BouncingScrollPhysics(),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorSelect.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                color: ColorSelect.blackColor.withOpacity(0.3),
                              ),
                            ],
                          ),
                          unselectedLabelColor: Colors.grey,
                          labelColor: ColorSelect.blackColor,
                          tabs: [
                            Tab(
                              child: CustomText(
                                text: 'All',
                                color: ColorSelect.blackColor,
                                fontsize: 12,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                                textOverflow: TextOverflow.clip,
                                height: 0.0,
                              ),
                            ),
                            Tab(
                              child: CustomText(
                                text: 'Men',
                                color: ColorSelect.blackColor,
                                fontsize: 12,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                                textOverflow: TextOverflow.clip,
                                height: 0.0,
                              ),
                            ),
                            Tab(
                              child: CustomText(
                                text: 'Women',
                                color: ColorSelect.blackColor,
                                fontsize: 12,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                                textOverflow: TextOverflow.clip,
                                height: 0.0,
                              ),
                            ),
                            Tab(
                              child: CustomText(
                                text: 'Kid',
                                color: ColorSelect.blackColor,
                                fontsize: 12,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                                textOverflow: TextOverflow.clip,
                                height: 0.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: TabBarView(
                          controller: tabController,
                          physics: BouncingScrollPhysics(),
                          children: [
                            // first tab bar view widget
                            AllProductSearchView(),
                            // second tab bar viiew widget
                            ManSearch(),
                            // third tab bar view widget
                            WomenSearch(),
                            // forth tab bar view widget
                            KidSearch(),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
