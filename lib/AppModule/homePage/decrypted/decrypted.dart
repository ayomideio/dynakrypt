import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dynakrypt/AppModule/public/customAppBar.dart';

import '../../../controllers/encryptController.dart';
import '../../public/colors_custom.dart';
import '../../public/custom_button.dart';
import '../widgets/bottomBar.dart';
import '../widgets/draywer.dart';

class DecryptedScreen extends StatelessWidget {
  DecryptedScreen({Key? key}) : super(key: key);
  var ctrl = Get.find<EncryptController>();

  @override
  Widget build(BuildContext context) {
    ctrl.onInit();
    return Scaffold(
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(Get.height * 0.135),
      //     child: SafeArea(
      //       child: CustomAppBar(
      //         text: 'Decrypt File',
      //         height: Get.height * 0.135,
      //       ),
      //     )),
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
                      'Select a file to decrypt',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: customButton(
                      text: 'Decrypt'.toUpperCase(),
                      function: () async {
                        await ctrl.pickAndDecrypt();
                        ctrl.onInit();
                      },
                      width: Get.width * 0.85,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
