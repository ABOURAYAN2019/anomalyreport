import 'dart:developer';

import 'package:anomalyreport/model/anomalymodel.dart';
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
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

class AddController extends GetxController {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController descriptionCrt = TextEditingController();
  TextEditingController nameCrt = TextEditingController();
  FirebaseDatabase database = FirebaseDatabase.instance;
  String? _user = Get.find<AuthController>().user;
  String? get user => _user;
  List<String> emplacements = [];
  List<String> types = [];
  late File? _photo;
  final ImagePicker _picker = ImagePicker();
  String emplacement = "";
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  String type = "";
  String link = "";

  String domaine = "";

  // MyServices myservices = Get.find();

  late DateTime date_debut;

  TextEditingController t_date_debut = TextEditingController();

  getdata() async {
    if (_user != null) {
      print(domaine);
      domaine = _user!.split("@")[1].split(".")[0];
      //  EasyLoading.show(status: "Téléchargement");
      await getemp();
      await gettype();
      //  EasyLoading.dismiss();
      update();
    }
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
    Random random = new Random();
    int randomid = 1000 + random.nextInt(9000);
    // CollectionReference col = firestore.collection('khatma');
    String newPostKey = "";
    AnomalyModel an = AnomalyModel(
        image: link,
        id: randomid.toString(),
        adddate: DateTime.now().microsecondsSinceEpoch,
        date: date_debut.microsecondsSinceEpoch,
        type: type,
        user: user,
        emplacement: emplacement,
        status: "En_cours",
        description: descriptionCrt.text);

    EasyLoading.show(status: 'Enregisterment en cours...');
    DatabaseReference ref = database.ref("$domaine/anomalies");
    newPostKey = ref.push().key!;
    await ref.child(newPostKey).update(an.toJson()).then((value) {
      EasyLoading.dismiss();
      showmsg("Votre anomalie à été ajoutéd à la base");
      t_date_debut.text = "";

      descriptionCrt.text = "";
      update();
    }).catchError((err) {
      EasyLoading.dismiss();
    });

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
      title: 'Alerte',
      desc: message,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    // setState(() {
    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      uploadFile();
    } else {
      print('No image selected.');
    }
    // });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    // setState(() {
    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      uploadFile();
    } else {
      print('No image selected.');
    }
    //  });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';
    EasyLoading.show(status: 'Enregisterment en cours...');
    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!);
      link = await ref.getDownloadURL();
      EasyLoading.dismiss();
      update();
    } catch (e) {
      print('error occured');
      EasyLoading.dismiss();
    }
  }

  addphoto() {
    Get.bottomSheet(Container(
        height: 150,
        color: Colors.grey,
        child: Center(
            child: Column(
          children: [
            ListTile(
                leading: new Icon(Icons.photo_library),
                title: new Text('Gallery'),
                onTap: () {
                  imgFromGallery();
                  Get.back();
                }),
            new ListTile(
              leading: new Icon(Icons.photo_camera),
              title: new Text('Camera'),
              onTap: () {
                imgFromCamera();
                Get.back();
              },
            ),
          ],
        ))));
  }
}
