import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dynakrypt/AppModule/drawerr/drawerScreen.dart';
import 'package:dynakrypt/AppModule/homePage/menuPage.dart';
import 'package:dynakrypt/AppModule/public/colors_custom.dart';
import 'package:dynakrypt/controllers/authController.dart';

import '../public/customAppBar.dart';
import '../public/custom_button.dart';
import '../public/heading_text.dart';

enum TypeLogin { Type1, Type2 }

class LoginType extends StatelessWidget {
  LoginType({Key? key}) : super(key: key);

  var ctrl = Get.find<AuthCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            customAppbar(text: "Login"),
            SizedBox(
              height: Get.height / 4,
            ),
            customButton(
                text: "Log in Type".toUpperCase(),
                textFont: 14,
                width: Get.width * 0.4),
            Container(
              height: Get.height * 0.18,
              width: Get.width - 30,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 1,
                        offset: Offset(-4, 25))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio<TypeLogin>(
                              value: TypeLogin.Type1,
                              groupValue: ctrl.type.value,
                              onChanged: (TypeLogin? value) {
                                ctrl.updateCharacter(false);
                              }),
                          myText(
                              textAlignment: TextAlign.start,
                              size: 12,
                              fontweight: FontWeight.bold,
                              color: CustomColor.blue,
                              text:
                                  "Normal Login (Asks for login credentials every\ntime critical data needs to be accessed)")
                        ],
                      ),
                      Row(
                        children: [
                          Radio<TypeLogin>(
                              value: TypeLogin.Type2,
                              groupValue: ctrl.type.value,
                              onChanged: (TypeLogin? value) {
                                ctrl.updateCharacter(true);
                              }),
                          myText(
                            textAlignment: TextAlign.start,
                            size: 11,
                            fontweight: FontWeight.bold,
                            color: CustomColor.blue,
                            text:
                                "Log in (Does not ask for login credentials when \naccessing critical data)",
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 6,
            ),
            customButton(
              text: "Log in".toUpperCase(),
              width: Get.width * 0.85,
              function: () async {
                await ctrl.setTypeOfUser();
                // ? Get.offAll(MenuScreen())
                // : Get.snackbar('Error', 'Sorry there was an error');

                // ctrl.signIn(
                //         name: ctrl.nameCtrl.text,
                //         password: ctrl.passwordCtrl.text,
                //         secret: ctrl.secretKeyCtrl.text)
                //     ? Get.to(DrawerScreen())
                //     : Get.snackbar(
                //         'Sorry', 'No user registered with this credentials');
                // await ctrl.setType().then((value) {
                //   if (value) {
                //     Get.to(MenuScreen());
                //   }
              },
            ),
          ],
        ),
      ),
    );
  }
}
