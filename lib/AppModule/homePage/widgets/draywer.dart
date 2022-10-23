import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../public/colors_custom.dart';
import '../../public/heading_text.dart';
import '../encryptedHistory/encryptedHistory.dart';

Widget customDrawer() {
  return Drawer(
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                    text: "DynaKrypt",
                    color: Colors.white,
                    size: 16,
                    fontweight: FontWeight.w800,
                    // fontFamily: 'urbanist'
                  )
                ],
              ),
            ),
            mytextWidget(text: 'Home'),
            mytextWidget(
                text: "Encryption History",
                onTap: () => Get.to(EncryptedHistory())),
            mytextWidget(text: "Encrypt File"),
            mytextWidget(text: "Decrypt File"),
            mytextWidget(text: "About Us"),
            mytextWidget(text: "Exit"),
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
  );
}

mytextWidget({required String text, Callback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.only(left: Get.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: myText(text: text, size: 18, color: CustomColor.blue),
          ),
          Divider(
            height: 2,
            thickness: 1,
          )
        ],
      ),
    ),
  );
}

class MyTextWidget extends StatelessWidget {
  MyTextWidget({super.key, this.onTap, required this.text});
  VoidCallback? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: Get.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: myText(text: text, size: 18, color: CustomColor.blue),
            ),
            Divider(
              height: 2,
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
