import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:anomalyreport/controller/HomeView.dart';
import 'package:anomalyreport/controller/auth_controller.dart';
import 'package:anomalyreport/core/functions/validinput.dart';
import 'package:anomalyreport/core/services.dart';
import 'dart:math';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anomalyreport/data/static.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:anomalyreport/model/anomalymodel.dart';
import 'package:anomalyreport/model/user_model.dart';
import 'package:anomalyreport/view/commonwidgets/custom-dropdown_form_field.dart';

import 'package:anomalyreport/view/screens/manage.dart';

class AdminController extends GetxController {
  List<String?> khatmausers = [];
  FirebaseDatabase database = FirebaseDatabase.instance;

  List<UserModel> users = [];

  int hzb = 0;
  String hizb = "";
  String type = "";
  String selectedusername = "";
  String repeated = "";
  UserModel registreduserselected = UserModel();

  UserModel selecteduser = UserModel();

  String? _user = Get.find<AuthController>().user;
  String? get user => _user;
  late UserModel _userdata;
  String? _userid = Get.find<AuthController>().uid;
  @override
  void onClose() {
    super.onClose();
  }

  close() {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      title: 'تحدير',
      desc: "تقوم الآن بحدف الختمة كاملة من قاعدة البيانات",
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        Get.back();
      },
    ).show();
  }

  @override
  void onInit() async {
    // getdata();
    // Getallusers();
    // TODO: implement onInit
    super.onInit();
  }
}
