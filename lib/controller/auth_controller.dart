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
  late Rx<User?> firebaseUser;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String? get user => firebaseUser.value?.email;
  String? get username => firebaseUser.value?.displayName;
  String? get uid => firebaseUser.value?.uid;
  bool isadmin = false;
  late UserModel _userdata;
  GlobalKey<FormState> formKey_ = GlobalKey<FormState>();

  @override
  void onInit() async {
    super.onInit();

    firebaseUser = Rx<User?>(firebaseAuth.currentUser);

    firebaseUser.bindStream(firebaseAuth.userChanges());
    if (uid != null) {
      await getuserdata();
    }

    // ever(firebaseUser, _setInitialScreen);
  }

  getuserdata() async {
    print(uid);
    // DocumentReference document = firestore.collection("Users").doc(uid);

    // await document.get().then((DocumentSnapshot value) =>
    //     _userdata = UserModel.fromJson(value.data() as Map<String, dynamic>));
    // isadmin = _userdata.isadmin ?? false;
    // update();
    // print(
    //     "userdata -----------------------------------------------------------------------------------");
    // print(_userdata.name);
    // print(_userdata.email);
  }

  void login() async {
    print(email.text + "@khatma.ma");
    print(password.text);
    try {
      EasyLoading.show(status: 'Connexion...');
      await firebaseAuth.signInWithEmailAndPassword(
          email: email.text + "@khatma.ma", password: password.text);
      await getuserdata();
      EasyLoading.dismiss();
      Get.offAll(ControlView());
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      print(e.code);
      Get.snackbar(
        'خطا في الوصول لحسابك',
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