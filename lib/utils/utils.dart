import 'dart:convert';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart' as path;
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
class Utils {

  Utils._();
  static Utils instance = Utils._();

  void setScreenOriantaion() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  // void init() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await SharedPrefs.instance.initPrefs();
  // }

  void showAlertDialog({required String title, required String body, required String positiveButtonText, required void Function() positiveButtonOnPressed, String? negativeButtonText, void Function()? negativeButtonOnPressed}){
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      backgroundColor: ColorSelect.primarycolor,
      title: CustomText(text: title, color: ColorSelect.whiteColor, fontsize: 30, textAlign: TextAlign.center, fontWeight: FontWeight.w600, textOverflow: TextOverflow.ellipsis, height: 0.0,),
      content: CustomText(text: body, color: ColorSelect.whiteColor, fontsize: 12, textAlign: TextAlign.center, fontWeight: FontWeight.normal, textOverflow: TextOverflow.ellipsis, height: 0.0,),
      actions: [
        TextButton(onPressed: positiveButtonOnPressed, child: Text(positiveButtonText , style: TextStyle(color: ColorSelect.whiteColor),)),
        Visibility(
          visible: negativeButtonOnPressed != null && negativeButtonText != null,
          child: TextButton(onPressed: negativeButtonOnPressed, child: Text(negativeButtonText ?? '' , style: TextStyle(color: ColorSelect.whiteColor),)))
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
      imageUrl: 'https://demofree.sirv.com/nope-not-here.jpg',
      errorWidget: (context, url, error) {
        return new Icon(Icons.error);
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

  Future<String?> download(String url) async {
    dio.Response response = await dio.Dio().get(
      url,
      options: dio.Options(
          responseType: dio.ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return (status ?? 0) < 500;
          }),
    );
    String imageName = path.basename(url);
    Directory appDir = await path_provider.getApplicationDocumentsDirectory();
    String localPath = path.join(appDir.path, imageName);
    File imageFile = File(localPath);
    var raf = imageFile.openSync(mode: FileMode.write);
    //  response.data is List<int>;
    raf.writeFromSync(response.data);
    await raf.close();
    return localPath;
  }

  String getBase64FormateFile(String path) {
    File file = File(path);
    print('File is = ' + file.toString());
    List<int> fileInByte = file.readAsBytesSync();
    String fileInBase64 = base64Encode(fileInByte,);
    return fileInBase64;
  }


  Future<Uint8List> getBytesFormateFile(String path) async {
    File file = File(path);
    print('File is = ' + file.toString());
    Uint8List bytes =  file.readAsBytesSync();
    ByteData data = ByteData.view(bytes.buffer);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: 100 , targetHeight: 100);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
}