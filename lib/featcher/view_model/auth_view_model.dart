// ignore_for_file: unused_field, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/model/user_model.dart';
import 'package:runstore/featcher/view/control.dart';
import 'package:runstore/featcher/view/login_screens_view/signin_account_view.dart';
import 'package:runstore/featcher/view_model/fire_store_user.dart';
import 'package:runstore/utils/shared/local_user_data.dart';

import '../../utils/utils.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  bool show = true;
  void changeStatePassword(bool select) {
    show = select;
    update();
  }

  bool showSignIn = true;
  void changeStatePasswordSignIn(bool select) {
    showSignIn = select;
    update();
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  final formKey = GlobalKey<FormState>();

  TextEditingController emailSingIn = TextEditingController();
  TextEditingController passwordSignIn = TextEditingController();
  final formKeySignIn = GlobalKey<FormState>();

  String? image;

  final Rx<User?> _user = Rx<User?>(null);
  String? get user => _user.value?.email;
  static LocalStorageData localStorageData =
      Get.put(LocalStorageData(), permanent: true);

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentData(_auth.currentUser!.uid);
    }
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleSignInAccount?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await _auth.signInWithCredential(credential).then((user) async {
      saveUser(user);
      Get.offAll(const ControlView());
    });
  }

  // void signInWithFacebook() async {
  //   final FacebookLoginResult loginResult = await _facebookauth.logIn();

  //   if (loginResult.status == FacebookLoginStatus.success) {
  //     final facebookAuthCredential =
  //         FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //     await FirebaseAuth.instance
  //         .signInWithCredential(facebookAuthCredential)
  //         .then((user) {
  //       saveUser(user);
  //       Get.offAll(HomeView());
  //     });
  //   }
  // }

  Future<void> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential)
          .then((user) async {
        saveUser(user);
        Get.offAll(ControlView());
      });
    }
    return null;
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: emailSingIn.text, password: passwordSignIn.text)
          .then((value) async {
        emailSingIn.clear();
        passwordSignIn.clear();
        getCurrentData(value.user!.uid);
      });
      Get.offAll(const ControlView());
    } catch (e) {
      Get.snackbar(
        "Error login account",
        '$e',
        colorText: ColorSelect.blackColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void creatAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((user) async {
        user.user?.updateDisplayName(name.text);
        emailSingIn.clear();
        passwordSignIn.clear();
        name.clear();
        saveUser(user);
      });

      Get.offAll(SignInAccount());
    } catch (e) {
      Get.snackbar(
        "Error login account",
        '$e',
        colorText: ColorSelect.blackColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name:  user.user!.displayName,
      image: user.user!.photoURL.toString() == null
            ? Utils.instance.urlUserPlacholder
            : user.user!.photoURL.toString(),
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }

  void getCurrentData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data() as Map<dynamic, dynamic>));
    });
  }
}
