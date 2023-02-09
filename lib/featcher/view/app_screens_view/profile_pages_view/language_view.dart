import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/utils/locale/language_all.dart';
import '../../../../utils/locale/locale_controller.dart';
import '../../../../utils/shared/shared_preferance.dart';
import '../../../view_model/lang_view_model.dart';
import '../../widgets/custom_text.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({Key? key}) : super(key: key);

  static LanguageViewModel languageViewModel =
      Get.put(LanguageViewModel(), permanent: true);

  static MyLocaleController myLocaleController =
      Get.put(MyLocaleController(), permanent: true);

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

enum SingingCharacter { one, two }

class _LanguageViewState extends State<LanguageView> {

  SingingCharacter? _character = SharedPrefs.instance.getLangState() == 'ar' ? SingingCharacter.one : SingingCharacter.two;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorSelect.scaffoldBackgroundColorCatagories,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ListTile(
              trailing: Container(
                height: 48,
                width: 48,
              ),
              title: CustomText(
                text: StringKey.language.tr,
                color: ColorSelect.textColor,
                fontsize: 17,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
                textOverflow: TextOverflow.clip,
                height: 0.0,
              ),
              leading: InkWell(
                onTap: () => Get.back(),
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
                    Icons.arrow_back_ios_new_rounded,
                    color: ColorSelect.blackColor,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            GetBuilder<MyLocaleController>(
              init: MyLocaleController(),
              builder: (controller) {
                return Expanded(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.8472,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: ColorSelect.whiteColor,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            width: double.infinity,
                            height: 200,
                            child: Column(
                              children: [
                                ListTile(
                                  title: CustomText(
                                    text: StringKey.arabic.tr,
                                    color: ColorSelect.textColor,
                                    fontsize: 17,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w600,
                                    textOverflow: TextOverflow.ellipsis,
                                    height: 0.0,
                                  ),
                                  trailing: Radio<SingingCharacter>(
                                    value: SingingCharacter.one,
                                    activeColor: ColorSelect.primarycolor,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter? value) {
                                      setState(() {
                                        _character = value;
                                        controller.changeLanguage('ar');
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: CustomText(
                                    text: StringKey.einglish.tr,
                                    color: ColorSelect.textColor,
                                    fontsize: 17,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w600,
                                    textOverflow: TextOverflow.ellipsis,
                                    height: 0.0,
                                  ),
                                  trailing: Radio<SingingCharacter>(
                                    value: SingingCharacter.two,
                                    activeColor: ColorSelect.primarycolor,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter? value) {
                                      setState(() {
                                        _character = value;
                                         controller.changeLanguage('en');
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
            // GetBuilder<LanguageViewModel>(
            //   init: LanguageViewModel(),
            //   builder: (controller) {
            //     return GridView.builder(
            //       physics: NeverScrollableScrollPhysics(),
            //       shrinkWrap: true,
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         mainAxisExtent: 280,
            //         childAspectRatio: 25,
            //         crossAxisSpacing: 10,
            //         mainAxisSpacing: 15,
            //       ),
            //       itemCount: 10,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Container(
            //           color: controller.loopColor(index , !ingoy),
            //         );
            //       },
            //     );
            //   }
            // )
          ],
        ),
      ),
    );
  }
}
