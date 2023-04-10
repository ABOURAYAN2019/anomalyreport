import 'dart:developer';

import 'package:anomalyreport/model/emplacementmodel.dart';
import 'package:anomalyreport/model/typeModel.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:anomalyreport/controller/HomeView.dart';
import 'package:anomalyreport/controller/auth_controller.dart';
import 'package:anomalyreport/core/services.dart';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anomalyreport/data/static.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:anomalyreport/model/user_model.dart';
import 'package:firebase_database/firebase_database.dart';

class AddController extends GetxController {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController descriptionCrt = TextEditingController();
  TextEditingController nameCrt = TextEditingController();
  FirebaseDatabase database = FirebaseDatabase.instance;

  List<String> emplacements = [];
  List<String> types = [];
  int hzb = 0;
  String emplacement = "";
  String type = "";

  String domaine = "";
  late String _dockey;
  late UserModel _userdata;
  String? _user = Get.find<AuthController>().user;
  String? _userid = Get.find<AuthController>().uid;
  String? get user => _user;

  // MyServices myservices = Get.find();

  late DateTime date_debut;

  TextEditingController t_date_debut = TextEditingController();
  TextEditingController t_date_fin = TextEditingController();

  getdata() async {
    domaine = _user!.split("@")[1].split(".")[0];
    print(domaine);
    EasyLoading.show(status: "Telechragement");
    await getemp();
    await gettype();
    EasyLoading.dismiss();
    update();
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

  gettype() async {
    Map emp;
    List<Map>? emp_ = [];
    List<TypeModel> cs = [];
    TypeModel c;
    DatabaseReference lconduceturs = database.ref('$domaine/type');
    DataSnapshot snapshot = await lconduceturs.get();
    inspect(snapshot.value);
    if (snapshot.value != null) {
      final map = snapshot.value as Map;
      map.forEach((key, value) {
        emp = value;
        emp['key'] = key;
        emp_?.add(value);
        // print(conducteur_);
        c = TypeModel.fromJson(emp);
        cs.add(c);
      });
      cs.forEach((element) {
        types.add(element.type ?? "");
      });
      print(types);
    }
  }

  save() async {
    // Random random = new Random();
    // Random random2 = new Random();
    // int randomid = 1000 + random.nextInt(9000);
    // int randomcode = 1000 + random2.nextInt(8000);
    // CollectionReference col = firestore.collection('khatma');
    // KhatmaModel kh = KhatmaModel(
    //     admin: user,
    //     description: descriptionCrt.text,
    //     id: randomid,
    //     useruid: _userid,
    //     man: repeated == "ختمة دورية يدوية" ? true : false,
    //     auto: repeated == "ختمة دورية تلقائية" ? true : false,
    //     name: nameCrt.text,
    //     type: type,
    //     code: randomcode + 100,
    //     status: "مفتوح",
    //     username: _userdata.name,
    //     date_debut: date_debut.microsecondsSinceEpoch,
    //     date_fin: date_fin.microsecondsSinceEpoch,
    //     emplacements: int.parse(emplacement),
    //     effectif: (60.0 / int.parse(emplacement)).round(),
    //     duration: date_fin.difference(date_debut).inDays,
    //     repeated: repeated);
    // EasyLoading.show(status: 'جاري الحفظ...');

    // await col.add(kh.toJson()).then((value) => _dockey = value.id);
    // print("&&&&-------------------------------------------------&&&&");

    // print(_dockey);
    // CollectionReference col2 =
    //     firestore.collection('khatma').doc(_dockey).collection("subscribers");
    // print("&&&&-------------------------------------------------&&&&");

    // print(kh.toJson());
    // getahazabbypart();
    // gtprogramme().forEach((key, value) => {col2.doc(key).set(value)});
    // EasyLoading.dismiss();

    // nameCrt.text = "";
    // descriptionCrt.text = "";
    // t_date_debut.text = "";
    // t_date_fin.text = "";
    // update();
    // showmsg(
    //     "مبروك لقد أتممت إنشاء مجموعة الحفظ ،عليك الآن دعوة أصدقائك  لإختيار الإجزاء ، والبدء بالختمة  ");
  }

  Adddatetimedebut() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            2020), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2025));
    if (pickedDate == null) return;

    TimeOfDay? newTime = await showTimePicker(
        context: Get.context!,
        builder: (context, child) {
          return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
              child: child!);
        },
        initialTime:
            TimeOfDay(hour: pickedDate.hour, minute: pickedDate.minute));
    if (newTime == null) return;
    final newDateTime = DateTime(pickedDate!.year, pickedDate.month,
        pickedDate.day, newTime.hour, newTime.minute);

    t_date_debut.text = DateFormat('yyyy-MM-dd').format(newDateTime);
    date_debut = newDateTime;
  }

  @override
  void onInit() async {
    await getdata();
    super.onInit();
  }

  @override
  void onClose() async {
    try {
      EasyLoading.dismiss();
    } catch (e) {}

    super.onClose();
  }

  Adddatedebut() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime
            .now(), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (pickedDate == null) return;

    t_date_debut.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    date_debut = pickedDate;
  }

  showmsg(String message) {
    AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: 'إخبار',
      desc: message,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }
}
