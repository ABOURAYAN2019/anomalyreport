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
      return (moncrt.user == null)
          ? OnBoarding()
          : GetBuilder<HomeView>(
              init: HomeView(),
              builder: (controller) => Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.amber,
                  leading: controller.pageicon,
                  title: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      controller.pagename,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'roboto'),
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
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }
}

class bottomNavigationBar extends StatelessWidget {
  bottomNavigationBar({Key? key}) : super(key: key);
  final List<BottomNavigationBarItem> list = [
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
      label: "Déclarer",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.factory,
        size: 30,
      ),
      activeIcon: Icon(
        Icons.factory,
        color: Colors.amber,
        size: 30,
      ),
      label: "Anomalies",
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
            fontFamily: 'roboto',
            fontWeight: FontWeight.normal),
        selectedLabelStyle: const TextStyle(
            color: Colors.amber,
            fontFamily: 'roboto',
            fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        items: list,
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
      ),
    );
  }
}
