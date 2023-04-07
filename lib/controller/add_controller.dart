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

class AddController extends GetxController {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController descriptionCrt = TextEditingController();
  TextEditingController nameCrt = TextEditingController();
  List<String> ahzabbypart = [];
  int hzb = 0;
  String hizb = "";
  String type = "";
  String repeated = "";
  late String _dockey;
  late UserModel _userdata;
  String? _user = Get.find<AuthController>().user;
  String? _userid = Get.find<AuthController>().uid;
  String? get user => _user;

  // MyServices myservices = Get.find();

  late DateTime date_debut;
  late DateTime date_fin;
  TextEditingController t_date_debut = TextEditingController();
  TextEditingController t_date_fin = TextEditingController();

  @override
  void onClose() {
    // called just before the Controller is deleted from memory

    super.onClose();
  }

  getuserdata() async {
    // print(_userid);
    // DocumentReference document = firestore.collection("Users").doc(_userid);

    // await document.get().then((DocumentSnapshot value) =>
    //     _userdata = UserModel.fromJson(value.data() as Map<String, dynamic>));
    // print(
    //     "userdata -----------------------------------------------------------------------------------");
    // print(_userdata.name);
    // print(_userdata.email);
  }

  save() async {
    // //HomeView Function({String? tag}) home = Get.find<HomeView> ;
    // HomeView home = Get.find<HomeView>();
    // Map<String, dynamic> myahzab = {};

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
    //     hizbs: int.parse(hizb),
    //     effectif: (60.0 / int.parse(hizb)).round(),
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
    await getuserdata();
    print(_userdata);
    super.onInit();
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

  Adddatefin() async {
    late DateTime selecteddate;
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime
            .now(), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime.now().add(const Duration(days: 365)));

    if (pickedDate != null) {
      selecteddate = pickedDate;
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      t_date_fin.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      date_fin = selecteddate;
    }
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
