import 'dart:developer';
import 'package:anomalyreport/model/emplacementmodel.dart';
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
  FirebaseDatabase database = FirebaseDatabase.instance;
  bool loading = false;
  String selectedeqp = "";
  List<AnomalyModel> anomalies = [];
  String resulttype = "Dernières contributions";
  List<String> emplacements = [];
  String domaine = "";
  bool isadmin = false;
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

  getdata() async {
    Map emp;
    List<Map>? emp_ = [];
    List<AnomalyModel> cs = [];
    AnomalyModel c;
    Query lconduceturs = database
            .ref('$domaine/anomalies')
            .orderByChild("status")
            .equalTo("En_cours")
        //.limitToLast(20);
        ;
    DataSnapshot snapshot = await lconduceturs.get();
    loading = true;
    inspect(snapshot.value);
    if (snapshot.value != null) {
      final map = snapshot.value as Map;
      map.forEach((key, value) {
        emp = value;
        emp['key'] = key;
        emp_?.add(value);
        // print(conducteur_);
        c = AnomalyModel.fromJson(emp);
        cs.add(c);
      });
      cs.forEach((element) {
        anomalies.add(element);
      });
      loading = false;
      //  inspect(emplacements);
    }
    // print(emplacements);
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
    if (_user != null) {
      print(domaine);
      domaine = _user!.split("@")[1].split(".")[0];
      //  EasyLoading.show(status: "Chargement");
      await getdata();
      await getemp();
      await getuser();
      //  EasyLoading.dismiss();
      update();
    }
    super.onInit();
  }

  getuser() async {
    DatabaseReference lconduceturs =
        database.ref('$domaine/users').child(_userid ?? "");
    DataSnapshot snapshot = await lconduceturs.get();
    if (snapshot.value != null) {
      inspect(snapshot.value);
      final map = snapshot.value as Map;
      print("------------------------------map----------------------------");
      isadmin = map["isadmin"] ?? false;
      inspect(isadmin);
    }
    ;
  }

  getemp() async {
    Map emp;
    List<Map>? emp_ = [];
    List<Emplacementmodel> cs = [];
    Emplacementmodel c;
    DatabaseReference lconduceturs = database.ref('$domaine/equipements');
    DataSnapshot snapshot = await lconduceturs.get();
    inspect(snapshot.value);
    if (snapshot.value != null) {
      final map = snapshot.value as Map;
      map.forEach((key, value) {
        emp = value;
        emp['key'] = key;
        emp_?.add(value);
        // print(conducteur_);
        c = Emplacementmodel.fromJson(emp);
        cs.add(c);
      });
      cs.forEach((element) {
        emplacements.add(element.eqp ?? "");
      });
      inspect(emplacements);
    }
    print(emplacements);
  }

  addhelper() {
    return showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: Text('Emplacement a chercher'),
            content: CustumDropdownSearch(
              items: emplacements,
              hintText: "Emplacement a chercher",
              onChange: (p0) {
                selectedeqp = p0 ?? '';
              },
              valid: (val) {
                return validInput(val!, 5, 30, "text");
              },
            ),
            actions: <Widget>[
              ElevatedButton(
                  child: Text("Chercher"),
                  onPressed: () {
                    Navigator.pop(context);
                    //   getdataarchive();
                  }),
            ],
          );
        });
  }

  getdataarchive() async {
    resulttype = "Anomalies   $selectedeqp";
    anomalies = [];

    Map emp;
    List<Map>? emp_ = [];
    List<AnomalyModel> cs = [];
    AnomalyModel c;
    Query lconduceturs = database
            .ref('$domaine/anomalies')
            .orderByChild("eqp")
            .equalTo(selectedeqp)
        //.limitToLast(20);
        ;
    DataSnapshot snapshot = await lconduceturs.get();
    loading = true;
    inspect(snapshot.value);
    if (snapshot.value != null) {
      final map = snapshot.value as Map;
      map.forEach((key, value) {
        emp = value;
        emp['key'] = key;
        emp_?.add(value);
        // print(conducteur_);
        c = AnomalyModel.fromJson(emp);
        cs.add(c);
      });
      cs.forEach((element) {
        anomalies.add(element);
      });
      loading = false;
      update();
      //  inspect(emplacements);
    }
  }
}
