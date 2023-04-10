import 'package:flutter/material.dart';
import 'package:anomalyreport/controller/add_controller.dart';
import 'package:anomalyreport/controller/admin_controller.dart';
import 'package:anomalyreport/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:anomalyreport/model/anomalymodel.dart';
import 'package:anomalyreport/view/commonwidgets/custom_text_form_multiline.dart';
import 'package:anomalyreport/view/commonwidgets/custombutton.dart';
import 'package:anomalyreport/view/commonwidgets/customslider.dart';
import 'package:anomalyreport/view/commonwidgets/customtextformfield.dart';
import 'package:anomalyreport/view/commonwidgets/dropdown_form_field.dart';

class Manage extends StatelessWidget {
  Manage({Key? key}) : super(key: key);

  final controller = Get.put(
    AdminController(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("eee"),
    );
  }
}
