import 'package:anomalyreport/controller/onboarding-controller.dart';
import 'package:anomalyreport/view/widgets/onboarding/custombutton.dart';
import 'package:anomalyreport/view/widgets/onboarding/customslider.dart';
import 'package:anomalyreport/view/widgets/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(children: [
              const Expanded(
                flex: 3,
                child: CustomSliderOnBoarding(),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: const [
                      CustomDotControllerOnBoarding(),
                      Spacer(flex: 2),
                      CustomButtonOnBoarding()
                    ],
                  ))
            ]),
          ),
        ));
  }
}
