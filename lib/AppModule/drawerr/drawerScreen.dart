import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dynakrypt/AppModule/homePage/menuPage.dart';
import 'package:dynakrypt/AppModule/public/customAppBar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/drawerController.dart';
import '../homePage/encryptedHistory/encryptedHistory.dart';
import '../homePage/widgets/draywer.dart';
import '../public/colors_custom.dart';
import '../public/heading_text.dart';
import 'dart:io';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key, this.index});
  int? index;
  var ctrl = Get.find<DrawerControllerr>();
  @override
  Widget build(BuildContext context) {
    if (index != null) {
      ctrl.changeIndex(index!);
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.135),
        child: SafeArea(child: Obx(() => ctrl.appbars[ctrl.index.value])),
      ),
      body: Obx(() {
        return ctrl.pages[ctrl.index.value];
      }),
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: Get.height * 0.125,
                  width: Get.width,
                  color: Color.fromRGBO(75, 90, 224, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: Get.height * 0.06,
                          width: Get.width * 0.1,
                          child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/logo1.png"))),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      myText(
                        text: "DynaKrypt ",
                        color: Colors.white,
                        size: 20,
                        fontweight: FontWeight.w800,
                        // fontFamily: 'urbanist'
                      )
                    ],
                  ),
                ),
                mytextWidget(
                    text: 'Mission Impossible',
                    onTap: () {
                      ctrl.changeIndex(0);
                      Get.back();
                    }),
                mytextWidget(
                    text: "Encryption History",
                    onTap: () {
                      ctrl.changeIndex(1);
                      Get.back();
                    }),
                mytextWidget(
                    text: "Encrypt File",
                    onTap: () {
                      ctrl.changeIndex(2);
                      Get.back();
                    }),
                mytextWidget(
                    text: "Decrypt File",
                    onTap: () {
                      ctrl.changeIndex(3);
                      Get.back();
                    }),
                mytextWidget(
                    text: "Notes",
                    onTap: () {
                      ctrl.changeIndex(4);
                      Get.back();
                    }),
                mytextWidget(
                    text: "About Us",
                    onTap: () {
                      ctrl.changeIndex(5);
                      Get.back();
                    }),

                mytextWidget(
                    text: "Privacy Policy",
                    onTap: () async{
                      await launchUrl(Uri.parse("https://dynakrypt.com/PP.html"));
                    }),

                mytextWidget(
                    text: "Terms and Conditions",
                    onTap: () async{
                      await launchUrl(Uri.parse("https://dynakrypt.com/EULA.html"));
                    }),
                mytextWidget(
                    text: "How To Use App",
                    onTap: () async{
                     await launchUrl(Uri.parse("https://dynakrypt.com/video.html"));
                    }),
                mytextWidget(
                    text: "Exit",
                    onTap: () {
                      ctrl.deleteeFile();exit(0);                    }),
                Spacer(),
                Center(
                    child: myText(
                        text: "Mobile version 2.0",
                        size: 16,
                        fontweight: FontWeight.w700,
                        color: CustomColor.blue)),
                SizedBox(
                  height: Get.height * 0.03,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
