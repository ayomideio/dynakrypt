import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/encryptController.dart';
import '../../public/customAppBar.dart';
import '../../public/custom_button.dart';
import '../../public/heading_text.dart';
import '../widgets/draywer.dart';

// enum Character { Type1, Type2, Type3 }

class MissionImpossibleScreen extends StatelessWidget {
  MissionImpossibleScreen({Key? key}) : super(key: key);
  var ctrl = Get.find<EncryptController>();

  @override
  Widget build(BuildContext context) {
    ctrl.onInit();
    return Scaffold(
      // appBar:  PreferredSize(
      //   preferredSize: Size.fromHeight(Get.height * 0.135),
      //   child: Obx(() => SafeArea(
      //         child: CustomAppBar(
      //           text: ctrl.pageNames[ctrl,
      //           height: Get.height * 0.135,
      //         ),
      //       )),
      // ),,
      resizeToAvoidBottomInset: false,
      drawer: customDrawer(),
      body: SafeArea(
        child:
        Center(
          child: Column(
            children: [

              SizedBox(
                height: Get.height / 10,
              ),
              customButton(
                  text: "Self Destruction",
                  textFont: 14,
                  width: Get.width * 0.4),
              Container(
                height: Get.height * 0.6,
                width: Get.width - 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 60,
                          spreadRadius: 1,
                          offset: Offset(-2, 50))
                    ]),
                child: Obx(() {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [
                            Radio<Character>(
                                value: Character.Type3,
                                groupValue: ctrl.character.value,
                                onChanged: (Character? value) {
                                  ctrl.changeType(value!, 2);
                                }),
                            myText(
                                textAlignment: TextAlign.start,
                                size: 12,
                                color: Colors.blue,
                                fontweight: FontWeight.w400,
                                text:
                                    "Self-Destruct after File has been open for a\nspecified amount of time")
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: Get.width * 0.12,
                                  right: Get.width * 0.03),
                              child: myText(
                                  textAlignment: TextAlign.start,
                                  size: 12,
                                  color: Colors.blue,
                                  fontweight: FontWeight.w400,
                                  text: "Specify Time (seconds)"),
                            ),
                            SizedBox(
                                height: Get.height * 0.025,
                                width: Get.width * 0.2,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: ctrl.secondsController,
                                  decoration: const InputDecoration(
                                    focusColor: Colors.blue,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(height: Get.height * 0.03),
                        Center(
                          child: customButton(
                              function: () {
                                printInfo(
                                    info: ctrl.character.toString() +
                                        ctrl.seconds.toString());
                                if (ctrl.character == Character.Type2) {
                                  ctrl.pickandencrypt(Character.Type2);
                                }

                                  if (ctrl.secondsController.text.isEmpty) {
                                    Get.snackbar(
                                        '0 Seconds', 'please provide Seconds');
                                  } else {
                                    ctrl.setSeconds(
                                        int.parse(ctrl.secondsController.text));
                                    ctrl.pickandencrypt(Character.Type3);
                                  }

                              },
                              text: "Upload File",
                              textFont: 14,
                              width: Get.width * 0.4),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: Get.width * 0.12,
                            top: Get.height * 0.02,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: Get.width / 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      myText(
                                        text: "60 (seconds)",
                                        color: Colors.blue,
                                      ),
                                      myText(
                                        text: "120 (seconds)",
                                        color: Colors.blue,
                                      ),
                                      myText(
                                        text: "240 (seconds)",
                                        color: Colors.blue,
                                      ),
                                      myText(
                                        text: "600 (seconds)",
                                        color: Colors.blue,
                                      ),
                                      myText(
                                        text: "3600 (seconds)",
                                        color: Colors.blue,
                                      ),
                                      myText(
                                        text: "86400 (seconds)",
                                        color: Colors.blue,
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                  width: Get.width / 20,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      myText(
                                        text: "=",
                                        color: Colors.blue,
                                      ),
                                      myText(
                                        text: "=",
                                        color: Colors.blue,
                                      ),
                                      myText(
                                        text: "=",
                                        color: Colors.blue,
                                      ),
                                      myText(
                                        text: "=",
                                        color: Colors.blue,
                                      ),
                                      myText(
                                        text: "=",
                                        color: Colors.blue,
                                      ),
                                      myText(
                                        text: "=",
                                        color: Colors.blue,
                                      ),
                                    ],
                                  )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  myText(
                                    text: "1 minute",
                                    color: Colors.blue,
                                  ),
                                  myText(
                                    text: "2 minutes",
                                    color: Colors.blue,
                                  ),
                                  myText(
                                    text: "4 minutes",
                                    color: Colors.blue,
                                  ),
                                  myText(
                                    text: "10",
                                    color: Colors.blue,
                                  ),
                                  myText(
                                    text: "1 hour",
                                    color: Colors.blue,
                                  ),
                                  myText(
                                    text: "24 hours",
                                    color: Colors.blue,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
