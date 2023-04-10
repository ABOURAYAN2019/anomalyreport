import 'dart:developer';
import 'dart:math';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:anomalyreport/controller/HomeView.dart';

import 'package:anomalyreport/core/services.dart';
import 'package:anomalyreport/core/user-service.dart';
import 'package:anomalyreport/model/user_model.dart';
import 'package:anomalyreport/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? email_, password_;
  MyServices myservices = Get.find();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser = Rxn<User>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String? get user => firebaseUser.value?.email;
  String? get username => firebaseUser.value?.displayName;
  String? get uid => firebaseUser.value?.uid;

  GlobalKey<FormState> formKey_ = GlobalKey<FormState>();

  @override
  void onInit() async {
    firebaseUser = Rx<User?>(firebaseAuth.currentUser);
    inspect(firebaseUser);
    firebaseUser.bindStream(firebaseAuth.userChanges());
    super.onInit();
  }

  void login() async {
    print(email.text);
    print(password.text);
    try {
      EasyLoading.show(status: 'Connexion...');
      await firebaseAuth.signInWithEmailAndPassword(
          email: email.text, password: password.text);

      EasyLoading.dismiss();
      Get.offAll(ControlView());
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      print(e.code);
      Get.snackbar(
        "Erreur lors de l'accès à votre compte",
        e.code,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  logout() async {
    await myservices.sharedPreferences.clear();
    await firebaseAuth.signOut();
  }

  Future<void> saveUser(UserCredential user) async {
    // await FireStoreUser().addUserToFireStore(UserModel(
    //   userId: user.user!.uid,
    //   email: user.user!.email,
    //   name: user.user!.displayName,
    //   pic: '',
    // ));
  }
}
