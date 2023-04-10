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
                      CustomTextformfield(
                        valid: (val) {
                          if (val == null) return "Vide";
                          return validInput(val!, 2, 30, "text");
                        },
                        hintText: "Date de detection ",
                        headingText: "Date de detection",
                        prefixIcon: Icon(Icons.date_range),
                        readonly: true,
                        onTap: () => controller.Adddatedebut(),
                        controller: controller.t_date_debut,
                      ),
                      CustumtextformfieldMultiline(
                        valid: (val) {
                          if (val == null) return "Vide";
                          return validInput(val!, 2, 30, "text");
                        },
                        hintText: "Description ",
                        controller: controller.descriptionCrt,
                        headingText: " Description",
                        readonly: false,
                        prefixIcon: Icon(
                          Icons.text_fields,
                        ),
                      ),
                      CustumDropdown(
                        valid: (val) {
                          if (val == null) return "Vide !";
                          return validInput(val!, 2, 30, "text");
                        },
                        onchanged: (val) {
                          controller.emplacement = val ?? "0";
                        },
                        items: controller.emplacements,
                        hintText: " Emplacement",
                      ),
                      CustumDropdown(
                          valid: (val) {
                            if (val == null) return "vide !";
                            return validInput(val!, 2, 30, "text");
                          },
                          onchanged: (val) {
                            controller.type = val ?? "";
                          },
                          items: controller.types,
                          hintText: "Type"),
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        title: Text("Image ou illustration"),
                        trailing: Row(
                          children: [
                            Icon(
                              Icons.camera,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.folder,
                              size: 40,
                            )
                          ],
                        ),
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
                        captiontext: 'Sauvegarder',
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
