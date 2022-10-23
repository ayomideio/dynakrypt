import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:dynakrypt/AppModule/homePage/decrypted/widget/folderText.dart';
import 'package:dynakrypt/AppModule/public/customAppBar.dart';
import 'package:dynakrypt/AppModule/public/heading_text.dart';

import '../../../controllers/encryptController.dart';
import '../../public/colors_custom.dart';
import '../../public/custom_button.dart';
import '../widgets/bottomBar.dart';
import '../widgets/draywer.dart';

class NotesScreen extends StatelessWidget {
  NotesScreen({Key? key}) : super(key: key);
  var ctrl = Get.find<EncryptController>();
  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   // drawer: customDrawer(),
        //   body:
        Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // customAppbar(text: 'Decrypted'),
          SizedBox(
            height: Get.height * 0.03,
          ),
          // Text(
          //   'Please write here',
          //   style: TextStyle(
          //     color: Colors.blue,
          //     fontSize: 15,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: ctrl.textController,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                  maxLines: 10,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Please write here',
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      fillColor: Colors.grey.shade200,
                      filled: true),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height / 60,
          ),
          customButton(
              text: 'Save notes',
              function: () {
                ctrl.encryptText();
              }),
        ],
      ),
    );
    // );
  }
}
