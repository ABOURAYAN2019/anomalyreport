import 'package:anomalyreport/view/control_view.dart';
import 'package:anomalyreport/view/screens/manage.dart';
import 'package:anomalyreport/view/screens/onboarding.dart';
import 'package:anomalyreport/view/screens/signin.dart';

import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => ControlView()),
  GetPage(name: "/onboarding", page: () => OnBoarding()),
  GetPage(name: "/home", page: () => OnBoarding()),
  GetPage(name: "/login", page: () => Signin()),
  GetPage(name: "/manage", page: () => Manage()),
];
