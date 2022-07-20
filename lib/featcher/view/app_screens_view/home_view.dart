import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/view/app_screens_view/search_view.dart';
import 'package:runstore/featcher/view/app_screens_view/tabbar_screens_view/all_view.dart';
import 'package:runstore/featcher/view/app_screens_view/tabbar_screens_view/kid_view.dart';
import 'package:runstore/featcher/view/app_screens_view/tabbar_screens_view/man_view.dart';
import 'package:runstore/featcher/view/app_screens_view/tabbar_screens_view/woman_view.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import 'package:runstore/featcher/view_model/get_data_user_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: GetBuilder<DataUser>(
            init: DataUser(),
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
                      leading: Container(
                        height: 48,
                        width: 48,
                      ),
                      title: CustomText(
                        text:
                            'Hi, ${FirebaseAuth.instance.currentUser?.displayName}!',
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
                    SizedBox(
                      height: 45,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7893,
                        child: TabBar(
                          physics: BouncingScrollPhysics(),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorSelect.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 6,
                                  color:
                                      ColorSelect.blackColor.withOpacity(0.3))
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
                          physics: BouncingScrollPhysics(),
                          children: [
                            // first tab bar view widget
                            AllView(), 
                            // second tab bar viiew widget
                            ManView(),
                            // third tab bar view widget
                            WomenView(),
                            // forth tab bar view widget
                            KidView(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
