import 'package:anomalyreport/controller/add_controller.dart';
import 'package:anomalyreport/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anomalyreport/view/commonwidgets/custom_text_form_multiline.dart';
import 'package:anomalyreport/view/commonwidgets/custombutton.dart';
import 'package:anomalyreport/view/commonwidgets/customslider.dart';
import 'package:anomalyreport/view/commonwidgets/customtextformfield.dart';
import 'package:anomalyreport/view/commonwidgets/dropdown_form_field.dart';

class Add extends StatelessWidget {
  Add({Key? key}) : super(key: key);

  final controller = Get.put(
    AddController(),
    permanent: false,
  );
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(3.0),
        child: Card(
            elevation: 4,
            child: GetBuilder<AddController>(
              builder: (controller) => Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.menu_book_outlined,
                          color: Colors.white,
                          size: 5,
                        ),
                        title: Text(
                          'معلومات الختمة',
                          style: TextStyle(color: Colors.white),
                        ),
                        tileColor: Colors.grey.shade500,
                      ),
                      CustomTextformfield(
                        hintText: "إسم الختمة ",
                        valid: (val) {
                          if (val == null) return "حقل فارغ";
                          return validInput(val!, 5, 30, "text");
                        },
                        headingText: "إسم الختمة _",
                        controller: controller.nameCrt,
                        readonly: false,
                        prefixIcon: Icon(
                          Icons.book,
                        ),
                      ),
                      CustumtextformfieldMultiline(
                        valid: (val) {
                          if (val == null) return "حقل فارغ";
                          return validInput(val!, 5, 30, "text");
                        },
                        hintText: "وصف الختمة ",
                        controller: controller.descriptionCrt,
                        headingText: "وصف الختمة _",
                        readonly: false,
                        prefixIcon: Icon(
                          Icons.text_fields,
                        ),
                      ),
                      CustomTextformfield(
                        valid: (val) {
                          if (val == null) return "حقل فارغ";
                          return validInput(val!, 5, 30, "text");
                        },
                        hintText: "بداية الختمة ",
                        headingText: "بداية الختمة",
                        prefixIcon: Icon(Icons.date_range),
                        readonly: true,
                        onTap: () => controller.Adddatedebut(),
                        controller: controller.t_date_debut,
                      ),
                      CustomTextformfield(
                        valid: (val) {
                          if (val == null) return "حقل فارغ";
                          return validInput(val!, 5, 30, "text");
                        },
                        hintText: " نهاية الختمة",
                        headingText: "نهاية الختمة",
                        prefixIcon: Icon(Icons.date_range),
                        readonly: true,
                        onTap: () => controller.Adddatefin(),
                        controller: controller.t_date_fin,
                      ),
                      CustumDropdown(
                        valid: (val) {
                          if (val == null) return "حقل فارغ";
                          return validInput(val!, 0, 3, "text");
                        },
                        onchanged: (val) {
                          controller.hizb = val ?? "0";
                        },
                        items: [
                          "1",
                          "2",
                          "3",
                          "4",
                          "5",
                          "6",
                          "10",
                          "12",
                          "15",
                          "20",
                          "30"
                        ],
                        hintText: " عدد الأحزاب لكل شخص",
                      ),
                      CustumDropdown(
                          valid: (val) {
                            if (val == null) return "حقل فارغ";
                            return validInput(val!, 5, 30, "text");
                          },
                          onchanged: (val) {
                            controller.repeated = val ?? "ختمة لمرة واحدة";
                          },
                          items: [
                            "ختمة لمرة واحدة",
                            "ختمة دورية يدوية",
                            "ختمة دورية تلقائية"
                          ],
                          hintText: " دورية الختمة"),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        onpressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            controller.save();
                          }
                        },
                        txtcolor: Colors.black,
                        backgroundColor: Colors.amber,
                        captiontext: 'حفظ الختمة',
                        icon: Icon(
                          Icons.save,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ],
                  ))),
            )));
  }
}
