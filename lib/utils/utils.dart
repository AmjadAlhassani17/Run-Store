import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';

import '../featcher/core/path/images_path.dart';
class Utils {

  Utils._();
  static Utils instance = Utils._();


  // void init() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await SharedPrefs.instance.initPrefs();
  // }

  void showAlertDialog({required String title, required String body, required String positiveButtonText, required void Function() positiveButtonOnPressed, String? negativeButtonText, void Function()? negativeButtonOnPressed}){
    Get.dialog(AlertDialog(
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      title: Text(title, textAlign: TextAlign.center, style: Theme.of(Get.context!).textTheme.headline4,),
      content: Text(body, textAlign: TextAlign.center, style: Theme.of(Get.context!).textTheme.bodyText1, maxLines: 5,),
      actions: [
        TextButton(onPressed: positiveButtonOnPressed, child: Text(positiveButtonText)),
        Visibility(
          visible: negativeButtonOnPressed != null && negativeButtonText != null,
          child: TextButton(onPressed: negativeButtonOnPressed, child: Text(negativeButtonText ?? '')))
        ],
    ));
  }


   showSnackbar({String? title, required String body, bool error = true}) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: !error ? ColorSelect.success : ColorSelect.error,
        message: body,
        duration: const Duration(seconds: 2),
        borderRadius: 10,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
    );
  }

  Widget networkImage({required String imageUrl, double? width, double? height, BoxFit fit = BoxFit.cover}){
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl),
              fit: fit,
            ),
          ),
        );
      },
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyjjfDvf4erXDIM7vd-vYKz6s0F0AHpDI1JA&usqp=CAU',
      errorWidget: (context, url, error) {
        return CachedNetworkImage(
            imageUrl: ImagesPath.error,
            errorWidget: (context, url, error) {
              return SizedBox(
                height: height,
                width: width,
                child: const Text("image"),
              );
            },
            fit: BoxFit.contain);
      },
      fit: BoxFit.cover,
      placeholder: (context, String? url) {
        return 
        // Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage(ImagesPath.error),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        //   child:
           Center(
            child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: ColorSelect.primarycolor,
                  strokeWidth: 2,
                )),
         // ),
        );
      },
    );
  } 


   void changeStatusBarColor({required Color statusBarColor, required Color navigationBarColor}){
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: navigationBarColor,
    statusBarColor: statusBarColor, 
  ));
  }


  // void showProgressDialog(){
  //   // ProgressDialog is a custom progress dialog widget.
  //   Get.dialog(const ProgressDialog(), barrierDismissible: false);
  // }

  void hideProgressDialog(){
    Get.back();
  }
}