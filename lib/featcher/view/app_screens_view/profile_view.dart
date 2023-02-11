import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/view/app_screens_view/profile_pages_view/language_view.dart';
import 'package:runstore/featcher/view/app_screens_view/profile_pages_view/my_order_view.dart';
import 'package:runstore/featcher/view_model/get_data_user_view_model.dart';
import 'package:runstore/utils/locale/language_all.dart';
import '../../../utils/utils.dart';
import '../../core/path/svgs_path.dart';
import '../../view_model/addimage_view_model.dart';
import '../widgets/custom_brand_list_tail.dart';
import '../widgets/custom_text.dart';
import 'cheack_out_views/check_out_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  static final AddImageViewModel addImageViewModel = Get.put(AddImageViewModel(), permanent: true);
  static final DataUser dataUser = Get.put(DataUser(), permanent: true);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      text: StringKey.profile.tr,
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
                  SizedBox(
                    height: 24,
                  ),
                  GetBuilder<AddImageViewModel>(
                    init: AddImageViewModel(),
                    builder: (controller) {
                    return Container(
                      width: 120.0,
                      height: 120.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: controller.amm != null
                          ? Image.network(
                              '${controller.amm}',
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              '${FirebaseAuth.instance.currentUser?.photoURL}',
                              width: 200,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                    );
                  }),
                  SizedBox(
                    height: 16,
                  ),
                  CustomText(
                    text: '${FirebaseAuth.instance.currentUser?.displayName}',
                    color: ColorSelect.textColor,
                    fontsize: 23,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w300,
                    textOverflow: TextOverflow.clip,
                    height: 0.0,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.6453,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: ColorSelect.whiteColor,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomListTail(
                              name: StringKey.cart.tr,
                              svg: SvgsPath.order,
                              trailing: () => Get.to(() => MyOrder()),
                              listTile: () => Get.to(() => MyOrder()),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomListTail(
                              name: StringKey.language.tr,
                              svg: SvgsPath.language,
                              trailing: () => Get.to(() => LanguageView()),
                              listTile: () => Get.to(() => LanguageView()),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomListTail(
                              name: StringKey.payment.tr,
                              svg: SvgsPath.payment,
                              trailing: () => Get.to(() => CheckOutView()),
                              listTile: () => Get.to(() => CheckOutView()),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomListTail(
                              name: StringKey.logout.tr,
                              svg: SvgsPath.filter,
                              trailing: () {
                                Utils.instance.showAlertDialog(title: StringKey.deleteAccount.tr, body: StringKey.checkDelete.tr, positiveButtonText: StringKey.done.tr, positiveButtonOnPressed: (){controller.signOut();Get.back();});
                              },
                              listTile: () {
                                Utils.instance.showAlertDialog(title: StringKey.deleteAccount.tr, body: StringKey.checkDelete.tr, positiveButtonText: StringKey.done.tr, positiveButtonOnPressed: (){controller.signOut();Get.back();});
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
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
// SizedBox(height: 100,),
//                 OutlinedButton(onPressed: (){
//                       controller.signOut();
//                     }, child: Text('Sign Out')),