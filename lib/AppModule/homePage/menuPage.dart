import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dynakrypt/AppModule/drawerr/drawerScreen.dart';
import 'package:dynakrypt/AppModule/homePage/widgets/draywer.dart';

import '../../controllers/drawerController.dart';
import '../public/customAppBar.dart';
import '../public/custom_button.dart';

class MenuScreen extends StatelessWidget {
  // var ctrl = Get.find<StoragePermissionController>();

  var dctrl = Get.put<DrawerControllerr>(DrawerControllerr());
  // MenuScreen();
  @override
  Widget build(BuildContext context) {
    // ctrl.onInit();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.135),
        child: SafeArea(
            child: CustomAppBar2(
          height: Get.height * 0.135,
        )),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // customAppbar(text: "Menu"),
              Spacer(),
              customButton(
                text: "Mission Impossible".toUpperCase(),
                function: () async {
                  await Get.to(DrawerScreen(
                    index: 0,
                  ));

                  // dctrl.changeIndex(0);
                  // Get.to(DrawerScreen());
                },
              ),
              SizedBox(height: Get.height / 18),
              customButton(
                text: "Encrypt".toUpperCase(),
                function: () async {
                  await Get.to(DrawerScreen(
                    index: 2,
                  ));
                },
              ),
              SizedBox(height: Get.height / 18),
              customButton(
                text: "Decrypt".toUpperCase(),
                function: () async {
                  // dctrl.changeIndex(2)
                  await Get.to(DrawerScreen(
                    index: 3,
                  ));
                },
              ),
              SizedBox(height: Get.height / 18),

              customButton(
                text: "Notes".toUpperCase(),
                function: () async {
                  // dctrl.changeIndex(2)
                  await Get.to(DrawerScreen(
                    index: 4,
                  ));
                },
              ),
              SizedBox(height: Get.height / 18),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
