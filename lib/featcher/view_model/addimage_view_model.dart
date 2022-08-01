import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:runstore/featcher/view_model/fire_store_user.dart';
import 'package:runstore/utils/constants.dart';

// ignore: camel_case_types
class addImageViewModel extends GetxController {
  String? amm;
  @override
  void onInit() async {
    super.onInit();
    getImage();
  }

  Future<String> getImage() async {
    return '${await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid).get().then(
      (value) {
        value.get('image');
        amm = value["image"];
      },
    )}';
  }

  File? imagePath;
  String? imagepath;
  final picker = ImagePicker();
  Future pickImage(ImageSource source) async {
    try {
      final image = await picker.pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      imagePath = imageTemporary;
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
    uploadImage().then(
      (value) async => {
        // ignore: avoid_print
        print("masg Image : " + value.toString()),
        imagepath = value,
        await FireStoreUser().updateImage(
          imagePath: imagepath.toString(),
        )
      },
    );
    Constant.imagePath = imagePath;
    update();
    Get.back();
  }

  String? imageUrl;
  Future<String?> uploadImage() async {
    final fileName = basename(imagePath!.path);
    final destination = 'files/$fileName';
    try {
      final ref = FirebaseStorage.instance.ref(destination).child("images/");
      await ref.putFile(imagePath!);
      imageUrl = await ref.getDownloadURL();
      // ignore: avoid_print
      print(imageUrl);
      return imageUrl;
    } catch (e) {
      return null;
    }
  }
}
