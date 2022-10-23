import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/encryptController.dart';

class EncryptedHistory extends StatelessWidget {
  const EncryptedHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.find<EncryptController>();
    ctrl.onInit();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.05),
                SizedBox(
                    height: Get.height / 1.3,
                    child: Obx(() {
                      return ListView.builder(
                          itemCount: ctrl.listforEncrypted.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              tileColor: ctrl.listforEncrypted[index].isSelected
                                  ? Colors.grey.shade300
                                  : Colors.white,
                              leading: Icon(
                                ctrl
                                        .getFileName(ctrl
                                            .listforEncrypted[index].file.path)
                                        .contains('.aes')
                                    ? Icons.enhanced_encryption_outlined
                                    : Icons.no_encryption_outlined,
                                color: Colors.blue,
                              ),
                              title: Text(
                                ctrl
                                    .getFileName(
                                        ctrl.listforEncrypted[index].file.path)
                                    .split('.')
                                    .first,
                                style: TextStyle(color: Colors.blue),
                              ),
                            );
                          });
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
