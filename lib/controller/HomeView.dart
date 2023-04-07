import 'package:anomalyreport/controller/admin_controller.dart';

import 'package:anomalyreport/view/screens/acces.dart';
import 'package:anomalyreport/view/screens/add.dart';
import 'package:anomalyreport/view/screens/kpiadmin.dart';
import 'package:anomalyreport/view/screens/kpiuser.dart';
import 'package:anomalyreport/view/screens/profile.dart';
import 'package:anomalyreport/view/screens/stats.dart';
import 'package:anomalyreport/view/screens/validate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anomalyreport/view/screens/viewuser.dart';

class HomeView extends GetxController {
  int _navigatorValue = 0;
  String _pagename = "مهامي";
  Widget _pageicon = Icon(Icons.mode_edit);
  get pagename => _pagename;
  get pageicon => _pageicon;
  get navigatorValue => _navigatorValue;

  Widget currentScreen = Stats();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = Stats();
          _pagename = "مهامي";

        //  Get.delete<EnduserController>();

          _pageicon = Icon(Icons.task);

          break;
        }
      case 1:
        {
          currentScreen = Validate();

          _pagename = "تتبع الختمات";
          _pageicon = Icon(Icons.person_2);
          //Get.delete<MissionController>();

          break;
        }

      case 2:
        {
          currentScreen = Kpiuser();
          // Get.delete<MissionController>();
          // Get.delete<EnduserController>();

          _pagename = "إحصائياتي";
          _pageicon = Icon(Icons.stacked_bar_chart);

          break;
        }
    }
    update();
  }

  void changeSelectedValueadmin(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 2:
        {
          currentScreen = Add();
          _pagename = "إضافة ختمة";
          Get.delete<AdminController>();
          // Get.delete<EnduserController>();
          // Get.delete<MissionController>();
          _pageicon = Icon(Icons.book);
          break;
        }
      case 1:
        {
          currentScreen = Validate();
          Get.delete<AdminController>();
          // Get.delete<MissionController>();
          _pagename = "تطور الختمات";
          _pageicon = Icon(Icons.menu);
          break;
        }
      case 0:
        {
          currentScreen = Stats();
          _pagename = "مهامي";
          Get.delete<AdminController>();
         // Get.delete<EnduserController>();
          _pageicon = Icon(Icons.task);

          break;
        }
      case 3:
        {
          currentScreen = Acces();

          // Get.delete<MissionController>();
          // Get.delete<EnduserController>();

          _pagename = "الإدارة";
          _pageicon = Icon(Icons.person_2);

          break;
        }

      case 4:
        {
          currentScreen = Kpiadmin();
          Get.delete<AdminController>();
          // Get.delete<EnduserController>();
          // Get.delete<MissionController>();

          _pagename = "إحصائيات";
          _pageicon = Icon(Icons.stacked_line_chart);

          break;
        }
    }
    update();
  }
}
