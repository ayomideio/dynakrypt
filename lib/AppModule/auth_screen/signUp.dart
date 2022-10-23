import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dynakrypt/AppModule/auth_screen/loginType.dart';
import 'package:dynakrypt/AppModule/auth_screen/userInformation.dart';
import 'package:dynakrypt/AppModule/public/customAppBar.dart';
import 'package:dynakrypt/AppModule/public/customTextField.dart';
import 'package:dynakrypt/AppModule/public/custom_button.dart';
import 'package:dynakrypt/controllers/authController.dart';

import '../public/colors_custom.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  var ctrl = Get.find<AuthCtrl>();

  @override
  Widget build(BuildContext context) {
    ctrl.rrnameCtrl.clear();
    ctrl.rrpasswordCtrl.clear();
    ctrl.rrsecretKeyCtrl.clear();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            customAppbar(text: 'Sign up'),
            SizedBox(
              height: Get.height / 6,
            ),
            customButton(
                text: 'User Information',
                width: 136,
                height: 40,
                textFont: Get.width * 0.037),
            Container(
              height: Get.height * 0.3,
              width: Get.width - 30,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(-2, 10))
                  ]),
              child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    children: [
                      TextField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: ctrl.rrnameCtrl,
                        obscureText: false,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: 'Name',
                            hintStyle: TextStyle(color: CustomColor.blue),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: CustomColor.blue),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      // customTextField(hintText: 'Name', ctrl: ctrl.rrnameCtrl),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      TextField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: ctrl.rrpasswordCtrl,
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: CustomColor.blue),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: CustomColor.blue),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                      SizedBox(
                        height: Get.height * 0.015,
                      )

                      // customTextField(
                      //     hintText: 'Password',
                      //     ctrl: ctrl.rrpasswordCtrl,
                      //     isPassword: true),
                      // SizedBox(
                      //   height: Get.height * 0.015,
                      // ),
                      ,
                      TextField(
                        controller: ctrl.rrsecretKeyCtrl,
                        textAlignVertical: TextAlignVertical.center,
                        obscureText: false,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: 'Secret Code',
                            hintStyle: TextStyle(color: CustomColor.blue),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: CustomColor.blue),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      )
                      // customTextField(
                      //     hintText: 'Secret code', ctrl: ctrl.rrsecretKeyCtrl),
                    ],
                  )),
            ),
            SizedBox(
              height: Get.height / 6,
            ),
            customButton(
                text: 'Next',
                width: Get.width * 0.85,
                function: () async {
                  await ctrl
                      .signUp(
                          name: ctrl.rrnameCtrl.text,
                          password: ctrl.rrpasswordCtrl.text,
                          secret: ctrl.rrsecretKeyCtrl.text)
                      .then((value) {
                    if (value) {
                      ctrl.rrnameCtrl.clear();
                      ctrl.rrpasswordCtrl.clear();
                      ctrl.rrsecretKeyCtrl.clear();
                      Get.to(UserInformation());
                    }
                  });
                })
          ],
        ),
      ),
    );
  }
}
