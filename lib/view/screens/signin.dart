import 'package:anomalyreport/controller/auth_controller.dart';
import 'package:anomalyreport/core/constant/colors.dart';
import 'package:anomalyreport/view/commonwidgets/custombutton.dart';
import 'package:anomalyreport/view/widgets/login/custom_formfield.dart';
import 'package:anomalyreport/view/widgets/login/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:anomalyreport/core/functions/validinput.dart';

import '../widgets/login/custom_button.dart';

class Signin extends StatelessWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController mycontroller = Get.put(AuthController());

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColor.primaryColor,
          ),
          CustomHeader(
            text: "Se connecter",
            onTap: () {},
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: AppColor.whiteshade,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Form(
                key: mycontroller.formKey_,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.09),
                      child: Lottie.asset("assets/images/car.json"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/bcars.png",
                        width: 150,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    CustomFormField(
                      headingText: "Utilisateur",
                      hintText: "Utilisateur",
                      controller: mycontroller.email,
                      valid: (val) {
                        return validInput(val!, 3, 30, "text");
                      },
                      onSave: (value) {
                        mycontroller.email_ = value;
                      },
                      obsecureText: false,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      suffixIcon: const SizedBox(),
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress,
                    ),
                    // CustomButton(
                    //   onpressed: () {
                    //     print("hello from button");
                    //     mycontroller.facebookSignInMethod();
                    //   },
                    //   backgroundColor: Colors.blue,
                    //   captiontext: 'الدخول بفيسبوك',
                    //   txtcolor: Colors.white,
                    //   icon: Icon(
                    //     Icons.facebook,
                    //     color: Colors.white,
                    //     size: 30,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                        headingText: "Mot de passe",
                        controller: mycontroller.password,
                        maxLines: 1,
                        prefixIcon: Icon(
                          Icons.key,
                          color: Colors.grey,
                        ),
                        valid: (val) {
                          return validInput(val!, 5, 30, "password");
                        },
                        onSave: (value) {
                          mycontroller.password_ = value;
                        },
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.text,
                        hintText: "au moins 8 caractères",
                        obsecureText: true,
                        suffixIcon: const SizedBox()),
                    SizedBox(
                      height: 10,
                    ),

                    // CustomButton(
                    //   onpressed: () {
                    //     print("hello from google button");
                    //     mycontroller.googleSignInMethod();
                    //   },
                    //   txtcolor: Colors.white,
                    //   backgroundColor: Colors.red,
                    //   captiontext: 'الدخول بحساب غوغل',
                    //   icon: Icon(
                    //     Icons.mail,
                    //     color: Colors.white,
                    //     size: 30,
                    //   ),
                    // ),

                    AuthButton(
                      onTap: () {
                        var formdata = mycontroller.formKey_.currentState;
                        formdata?.save();
                        if (formdata!.validate()) {
                          mycontroller.login();
                        }
                      },
                      text: 'Accéder à mon compte ',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
