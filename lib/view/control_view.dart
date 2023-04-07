import 'package:anomalyreport/controller/HomeView.dart';
import 'package:anomalyreport/controller/auth_controller.dart';
import 'package:anomalyreport/view/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    AuthController moncrt = Get.find<AuthController>();
    Get.put(HomeView());
    return Obx(() {
      AuthController().getuserdata();
      return (moncrt.user == null)
          ? OnBoarding()
          : GetBuilder<HomeView>(
              init: HomeView(),
              builder: (controller) => Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.amber,
                    leading: controller.pageicon,
                    title: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        controller.pagename,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'almarai'),
                      ),
                    ),
                    actions: [
                      // IconButton(
                      //   onPressed: () {
                      //     Get.to(() => Profile(),
                      //         transition: Transition.downToUp,
                      //         duration: Duration(milliseconds: 500));
                      //   },
                      //   icon: Icon(Icons.person_2_sharp),
                      //   color: Colors.white,
                      // )
                    ],
                  ),
                  body: controller.currentScreen,
                  bottomNavigationBar: bottomNavigationBar(
                    isadmin: moncrt.isadmin,
                  ),
                ),
              ),
            );
    });
  }
}

class bottomNavigationBar extends StatelessWidget {
  final choice;
  final bool isadmin;
  bottomNavigationBar({Key? key, this.choice, required this.isadmin})
      : super(key: key);
  final List<BottomNavigationBarItem> adminlist = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.task_alt,
        size: 30,
      ),
      activeIcon: Icon(
        Icons.task_alt,
        color: Colors.amber,
        size: 30,
      ),
      label: "مهامي",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.trending_up,
        size: 30,
      ),
      activeIcon: Icon(
        Icons.trending_up,
        color: Colors.amber,
        size: 30,
      ),
      label: "تطور الختمات",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.new_label,
        size: 30,
      ),
      activeIcon: Icon(
        Icons.new_label,
        color: Colors.amber,
        size: 30,
      ),
      label: "ختمة جديدة",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.admin_panel_settings_sharp,
        size: 30,
      ),
      activeIcon: Icon(
        Icons.admin_panel_settings_sharp,
        color: Colors.amber,
        size: 30,
      ),
      label: "الإدارة",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.stacked_bar_chart_outlined,
        size: 30,
      ),
      activeIcon: Icon(
        Icons.stacked_bar_chart_outlined,
        color: Colors.amber,
        size: 30,
      ),
      label: "إحصائيات",
    )
  ];
  final List<BottomNavigationBarItem> userliste = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.task_alt,
        size: 30,
      ),
      activeIcon: Icon(
        Icons.task_alt,
        color: Colors.amber,
        size: 30,
      ),
      label: "مهامي",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.trending_up_outlined,
        size: 30,
      ),
      activeIcon: Icon(
        Icons.trending_up_outlined,
        color: Colors.amber,
        size: 30,
      ),
      label: "تتبع الختمات",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.stacked_bar_chart_rounded,
        size: 30,
      ),
      activeIcon: Icon(
        Icons.stacked_bar_chart_rounded,
        color: Colors.amber,
        size: 30,
      ),
      label: "إحصائياتي",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeView>(
      init: HomeView(),
      builder: (controller) => BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 10,
        selectedItemColor: Colors.amber,
        unselectedLabelStyle: const TextStyle(
            color: Colors.black87,
            fontFamily: 'almarai',
            fontWeight: FontWeight.normal),
        selectedLabelStyle: const TextStyle(
            color: Colors.amber,
            fontFamily: 'almarai',
            fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        items: isadmin == true ? adminlist : userliste,
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          isadmin == false
              ? controller.changeSelectedValue(index)
              : controller.changeSelectedValueadmin(index);
        },
      ),
    );
  }
}
