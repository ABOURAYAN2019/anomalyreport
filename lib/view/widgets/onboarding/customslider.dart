import 'package:anomalyreport/controller/onboarding-controller.dart';
import 'package:anomalyreport/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:anomalyreport/data/static.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Text(onBoardingList[i].title!,
                    style: const TextStyle(
                        fontFamily: 'almarai',
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                const SizedBox(height: 80),
                Image.asset(
                  onBoardingList[i].image!,
                  width: Get.width * 0.75,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 80),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBoardingList[i].body!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'almarai',
                          height: 2,
                          color: AppColor.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    )),
              ],
            ));
  }
}
