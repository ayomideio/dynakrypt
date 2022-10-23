// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dynakrypt/AppModule/auth_screen/signUp.dart';
import 'package:dynakrypt/AppModule/auth_screen/userInformation.dart';
import 'package:dynakrypt/AppModule/public/colors_custom.dart';
import 'package:dynakrypt/AppModule/public/custom_button.dart';
import 'package:dynakrypt/AppModule/public/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

import '../public/heading_text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    printInfo(info: 'permissions');

    askPermission();
  }

  void askPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.manageExternalStorage,
      Permission.storage,
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height / 5,
            ),
            Container(
              height: 200,
              width: Get.width - 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo1.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            myText(
                text: 'Welcome To',
                color: Color.fromRGBO(250, 160, 0, 1),
                size: 16),
            GradientText('DynaKrypt',

                gradient: const LinearGradient(colors: [
                  Color.fromRGBO(158, 75, 224, 1),
                  Color.fromRGBO(40, 166, 225, 1),
                ]),
                size: 36),
            SizedBox(
              height: Get.height / 7,
            ),
            customButton(
                text: 'Login',
                function: () =>
                    Get.to(UserInformation()) //Get.to(UserInformation())
                ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            GestureDetector(
              onTap: () {
                Get.to(SignUpScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myText(text: 'New User? ', color: CustomColor.blue),
                  myText(text: 'Sign Up Instead', color: Colors.grey)
                ],
              ),
            ),
            Expanded(child: Container()),
            myText(
                text: 'Mobile version 2.0'.toUpperCase(),
                color: CustomColor.blue,
                size: 16),
            SizedBox(
              height: Get.height * 0.03,
            )
          ],
        ),
      ),
    );
  }
}
