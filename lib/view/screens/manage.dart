import 'package:flutter/material.dart';
import 'package:anomalyreport/controller/add_controller.dart';
import 'package:anomalyreport/controller/admin_controller.dart';
import 'package:anomalyreport/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anomalyreport/model/khatmamodel.dart';
import 'package:anomalyreport/model/partmodel.dart';
import 'package:anomalyreport/view/commonwidgets/custom_text_form_multiline.dart';
import 'package:anomalyreport/view/commonwidgets/custombutton.dart';
import 'package:anomalyreport/view/commonwidgets/customslider.dart';
import 'package:anomalyreport/view/commonwidgets/customtextformfield.dart';
import 'package:anomalyreport/view/commonwidgets/dropdown_form_field.dart';
import 'package:anomalyreport/view/commonwidgets/khatmadisplay.dart';
import 'package:anomalyreport/view/commonwidgets/khatmadisplaybis.dart';

class Manage extends StatelessWidget {
  Manage({Key? key}) : super(key: key);
  final KhatmaModel khatma = Get.arguments[0];
  final List<PartModel> parts = Get.arguments[1];
  final controller = Get.put(
    AdminController(),
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: Text("إدراة الختمة"),
            ),
            body: SafeArea(
                child: Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(3.0),
                    child: GetBuilder<AdminController>(
                      builder: (controller) => ListView(
                        children: [
                          KhtamaDisplaybis(
                            id: 0,
                            enabled: false,
                            khtama: khatma,
                            onpressed: (id) {
                              ;
                            },
                            buttonmsg: "-----",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            captiontext: "نشر الختمة",
                            txtcolor: Colors.white,
                            icon: Icon(Icons.share),
                            backgroundColor: Colors.green,
                            onpressed: (() {
                              //   controller.share();
                            }),
                          ),
                          CustomButton(
                            captiontext: "حدف الختمة ",
                            txtcolor: Colors.white,
                            icon: Icon(Icons.cancel),
                            backgroundColor: Colors.red.shade400,
                            onpressed: (() {
                              controller.close();
                            }),
                          ),
                          (khatma.man == true) && (khatma.finished == true)
                              ? CustomButton(
                                  captiontext: "جولة جديدة ",
                                  txtcolor: Colors.black,
                                  icon: Icon(Icons.refresh),
                                  backgroundColor: Colors.amber,
                                  onpressed: (() {
                                    // controller.newkhatma();
                                  }),
                                )
                              : SizedBox.shrink(),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(3.0),
                            child: ListTile(
                              tileColor: Colors.amber,
                              leading: Icon(
                                Icons.manage_accounts,
                                color: Colors.black,
                              ),
                              title: Text(
                                " إدارة الأجزاء ",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(3.0),
                            child: Card(
                              elevation: 5,
                              child: ListView.builder(
                                  itemCount: parts.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                          child: Text((int.parse(
                                                      parts[index].id ?? "0") +
                                                  1)
                                              .toString())),
                                      trailing: parts[index].finished == true
                                          ? Text(
                                              " قرأه : " +
                                                  (parts[index].reader ?? ""),
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.green),
                                            )
                                          : parts[index].owername == ""
                                              ? ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors
                                                                  .lightGreen),
                                                  child: Text("أضف قارئ",
                                                      style: TextStyle(
                                                          fontSize: 10)),
                                                  onPressed: () {
                                                    controller.selectedpart =
                                                        parts[index];
                                                    //   controller.addreader(index);
                                                    print(
                                                        "--------remove user----------");
                                                  },
                                                )
                                              : parts[index].owername2 == ""
                                                  ? ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors
                                                                      .lightBlue
                                                                      .shade400),
                                                      child: Text("أضف مساعد",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: Colors
                                                                  .white)),
                                                      onPressed: () {
                                                        controller
                                                                .selectedpart =
                                                            parts[index];
                                                        // controller
                                                        //     .addhelper(index);
                                                        print(
                                                            "--------remove user----------");
                                                      },
                                                    )
                                                  : ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.red
                                                                      .shade400),
                                                      child: Text(
                                                          "مسح المشاركين",
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: Colors
                                                                  .white)),
                                                      onPressed: () {
                                                        controller
                                                                .selectedpart =
                                                            parts[index];
                                                        // controller
                                                        //     .removeuserfromdb(
                                                        //         index);
                                                        print(
                                                            "--------remove user----------");
                                                      },
                                                    ),
                                      title: Text(
                                        parts[index].fromto ?? "",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                      ),
                                      subtitle: parts[index].taked == true
                                          ? Text(
                                              (parts[index].owername ?? "") +
                                                  " " +
                                                  (parts[index].owername2 ??
                                                      ""),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 10))
                                          : Text(
                                              "جزء شاغر",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 10,
                                              ),
                                            ),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    )))));
  }
}
