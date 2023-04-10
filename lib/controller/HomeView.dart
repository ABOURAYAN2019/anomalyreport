import 'package:anomalyreport/controller/add_controller.dart';
import 'package:anomalyreport/controller/admin_controller.dart';
import 'package:anomalyreport/view/screens/add.dart';
import 'package:anomalyreport/view/screens/manage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetxController {
  int _navigatorValue = 0;
  String _pagename = "Déclarer une anomalie";
  Widget _pageicon = Icon(Icons.mode_edit);
  get pagename => _pagename;
  get pageicon => _pageicon;
  get navigatorValue => _navigatorValue;

  Widget currentScreen = Add();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          Get.delete<AdminController>();
          currentScreen = Add();

          _pagename = "Déclarer une anomalie";

          //  Get.delete<EnduserController>();

          _pageicon = Icon(Icons.task);

          break;
        }
      case 1:
        {
          Get.delete<AddController>();
          currentScreen = Manage();

          _pagename = "Consulter et gérer";
          _pageicon = Icon(Icons.factory);
          //Get.delete<MissionController>();

          break;
        }
    }
    update();
  }
}
