import 'dart:async';

import 'package:dynakrypt/AppModule/public/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../WelcomeScreen/welcomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    // Get.find<AuthCtrl>();
    Get.offAll(() => WelcomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: Get.height / 3,
            ),
            Container(
              height: 200,
              width: Get.width - 30,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/logo1.png'),
                      fit: BoxFit.contain)),
            ),
            myText(
                text: 'A Mathematical Modeling Inc. (MMI) App \n DynaKrypt',
                color: Color.fromRGBO(250, 160, 0, 1),
                size: 16),
            Expanded(child: Container()),
            SizedBox(
              height: Get.height / 15,
              child: myText(
                  text: 'Where Innovation Meets Creativity',
                  color: Color.fromRGBO(75, 90, 224, 1),
                  size: 18),
            )
          ],
        ),
      ),
    );
  }
}
