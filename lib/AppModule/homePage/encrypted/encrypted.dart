import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dynakrypt/AppModule/public/customAppBar.dart';
import 'package:dynakrypt/controllers/encryptController.dart';

import '../../public/colors_custom.dart';
import '../../public/custom_button.dart';
import '../widgets/bottomBar.dart';
import '../widgets/draywer.dart';

class EncryptedScreen extends StatelessWidget {
  EncryptedScreen({Key? key}) : super(key: key);
  var ctrl = Get.find<EncryptController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Select a file to encrypt',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: customButton(
                      text: 'Encrypt'.toUpperCase(),
                      function: () async {
                        ctrl.pickAndEncryptFileSimply(ctrl.character.value);
                        // ctrl.onInit();
                      },
                      width: Get.width * 0.85,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
    //  Scaffold(
    //   // drawer: customDrawer(),
    //   body: SafeArea(
    //     child: Center(
    //       child: Center(
    //           child: customButton(
    //         text: 'Encrypt'.toUpperCase(),
    //         function: () => ctrl.pickAndEncryptFileSimply(
    //             ctrl.character.value), //ctrl.encryptText(),
    //         width: Get.width * 0.85,
    //       )),
    //     ),
    //   ),
    //   // bottomSheet: Padding(
    //   //   padding: const EdgeInsets.symmetric(vertical: 15),
    //   //   child: Row(
    //   //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //   //     children: [
    //   //       Icon(
    //   //         Icons.check_circle_outline_rounded,
    //   //         color: CustomColor.blue,
    //   //       ),
    //   //       InkWell(
    //   //           onTap: () {
    //   //             ctrl.pickAndEncryptFile(ctrl.character.value);
    //   //           },
    //   //           child: Icon(Icons.add_circle_outline_sharp,
    //   //               color: CustomColor.blue)),
    //   //       Icon(Icons.delete_outline_sharp, color: CustomColor.blue),
    //   //       Icon(Icons.drive_folder_upload_outlined, color: CustomColor.blue),
    //   //     ],
    //   //   ),
    //   // )
    // );
  }
}
