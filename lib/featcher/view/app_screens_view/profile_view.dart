import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/view/app_screens_view/profile_pages_view/language_view.dart';
import 'package:runstore/featcher/view/app_screens_view/profile_pages_view/my_order_view.dart';
import 'package:runstore/featcher/view_model/get_data_user_view_model.dart';
import '../../../utils/utils.dart';
import '../../core/path/svgs_path.dart';
import '../../view_model/addimage_view_model.dart';
import '../widgets/custom_brand_list_tail.dart';
import '../widgets/custom_text.dart';
import 'cheack_out_views/check_out_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  static DataUser getDataViewModel = Get.put(DataUser(), permanent: true);
  // static addImageViewModel addimage = Get.put(addImageViewModel(),permanent: true);
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
                      text: 'Profile',
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
                  GetBuilder<addImageViewModel>(builder: (controller) {
                    return InkWell(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            backgroundColor:
                                ColorSelect.scaffoldBackgroundColor,
                            builder: (BuildContext context) {
                              return Container(
                                height: 150,
                                color: ColorSelect.scaffoldBackgroundColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: 75,
                                      color:
                                          ColorSelect.scaffoldBackgroundColor,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  ColorSelect
                                                      .scaffoldBackgroundColor),
                                        ),
                                        child: ListTile(
                                          leading: const Icon(
                                            Icons.camera_alt_rounded,
                                            size: 30,
                                            color: ColorSelect.textColor,
                                          ),
                                          title: CustomText(
                                            text: 'Camera',
                                            color: ColorSelect.blackColor,
                                            fontsize: 20,
                                            textAlign: TextAlign.left,
                                            fontWeight: FontWeight.normal,
                                            height: 0.0,
                                            textOverflow: TextOverflow.clip,
                                          ),
                                        ),
                                        onPressed: () {
                                          controller
                                              .pickImage(ImageSource.camera);
                                        },
                                      ),
                                    ),
                                    Container(
                                      height: 75,
                                      color:
                                          ColorSelect.scaffoldBackgroundColor,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  ColorSelect
                                                      .scaffoldBackgroundColor),
                                        ),
                                        child: ListTile(
                                          leading: const Icon(
                                            Icons.photo_album_rounded,
                                            size: 30,
                                            color: ColorSelect.textColor,
                                          ),
                                          title: CustomText(
                                            text: 'Gallery',
                                            color: ColorSelect.blackColor,
                                            fontsize: 20,
                                            textAlign: TextAlign.left,
                                            fontWeight: FontWeight.normal,
                                            height: 0.0,
                                            textOverflow: TextOverflow.clip,
                                          ),
                                        ),
                                        onPressed: () {
                                          controller
                                              .pickImage(ImageSource.gallery);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 120.0,
                          height: 120.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: controller.amm != " "
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
                        ));
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
                              name: 'My Card',
                              svg: SvgsPath.order,
                              trailing: () => Get.to(() => MyOrder()),
                              listTile: () => Get.to(() => MyOrder()),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomListTail(
                              name: 'Language',
                              svg: SvgsPath.language,
                              trailing: () => Get.to(() => LanguageView()),
                              listTile: () => Get.to(() => LanguageView()),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomListTail(
                              name: 'Payment',
                              svg: SvgsPath.payment,
                              trailing: () => Get.to(() => CheckOutView()),
                              listTile: () => Get.to(() => CheckOutView()),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomListTail(
                              name: 'Volunteer Support',
                              svg: SvgsPath.chat,
                              trailing: () {},
                              listTile: () {},
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomListTail(
                              name: 'Log Out',
                              svg: SvgsPath.filter,
                              trailing: () {
                                Utils.instance.showAlertDialog(title: 'Delete Account', body: 'Are You sure delete account?', positiveButtonText: 'done', positiveButtonOnPressed: (){controller.signOut();});
                              },
                              listTile: () {
                                Utils.instance.showAlertDialog(title: 'Delete Account', body: 'Are You sure delete account?', positiveButtonText: 'done', positiveButtonOnPressed: (){controller.signOut();});
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