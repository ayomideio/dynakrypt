import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dynakrypt/AppModule/homePage/decrypted/decrypted.dart';
import 'package:dynakrypt/AppModule/homePage/encrypted/encrypted.dart';
import 'package:dynakrypt/AppModule/homePage/encryptedHistory/encryptedHistory.dart';
import 'package:dynakrypt/AppModule/homePage/missionImpossible/missionImpossible.dart';
import 'package:dynakrypt/AppModule/homePage/notes/notes.dart';
import 'package:dynakrypt/AppModule/public/customAppBar.dart';
import 'package:dynakrypt/bindings/mybindings.dart';
import 'package:dynakrypt/controllers/encryptController.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

// SharedPreferences? prefs;

class DrawerControllerr extends GetxController {
  void deleteeFile() async {
    bool a = box.get('currentType') as bool;
    String name = box.get('currentUser')!;
    int n =
        box.get(name + '000' + name + '222' + name + '444', defaultValue: 0);
    if (a != false) {
       deleteUserFolder(name);
      await box.put(name + name + name, 0);
      Future.delayed(Duration(seconds: 1));
      printInfo(info: 'the files has been deleted');
      onInit();
    }
    printInfo(info: 'the value of n' + n.toString());
  }

  List appbars = [
    CustomAppBar(
      text: 'DynaKrypt',
      height: Get.height * 0.135,
    ),
    EncryptionHistoryAppbar(
      text: 'Encryption History',
      height: Get.height * 0.135,
    ),
    EncryptAppbar(
      text: 'Encrypt File',
      height: Get.height * 0.135,
    ),
    EncryptAppbar(
      text: 'Decrypt File',
      height: Get.height * 0.135,
    ),
    NotesAppbar(
      text: 'Notes',
      height: Get.height * 0.135,
    ),
    AboutUsAppbar(
      text: 'About Us',
      height: Get.height * 0.135,
    ),
  ];

  void deleteUserFolder(String name)async {
    final Directory _appDocDir=await getApplicationDocumentsDirectory();
    Directory d = Directory("${_appDocDir.path}/$name");

    d.deleteSync(recursive: true);
  }

  EncryptController? ctrl;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    MyBindings().dependencies();
    ctrl = Get.find<EncryptController>();
    // ctrl!.onInit();
    // prefs = await SharedPreferences.getInstance();

    // askPermission();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    // MyBindings().dependencies();
    // askPermission();

    // var ctrl = Get.find<EncryptController>();
  }

  List pageNames = [
    'Mission Impossible',
    'Encryption History',
    'Encrypt File',
    'Decrypt File',
    'Notes',
    'About Us',
    'Exit'
  ];

  List pages = [
    MissionImpossibleScreen(),
    EncryptedHistory(),
    EncryptedScreen(),
    DecryptedScreen(),
    NotesScreen(),
    Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          "Mathematical Modeling, Inc.\n (MMI) Mathematical Modeling, Inc. is a 21st century technology driven enterprise devoted to innovation and origination of cybersecurity solutions, AI systems, and green energy field programs. The MMI team promotes the standard that MMI is where innovation meets creativity. MMI’s union of creative thinkers and engineers all across the world believe that people working together can make the once seemingly impossible become reality. MMI aims to use the creativity of its experts and specialists to lead the charge of exploring and utilizing untapped potential for advancement within the globally interconnected universe. This is the revolutionary philosophy that has resulted in the development of DynaKrypt®.",
        ),
      ),
    )
  ];
  RxInt index = 0.obs;
  changeIndex(int i) {
    index.value = i;
    // if (i == 1) {
    //   ctrl!.;
    // }
    update();
  }

  void askPermission() async {
    var status = await Permission.manageExternalStorage.status;
    var status2 = await Permission.storage.status;
    var status3 = await Permission.accessMediaLocation.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.status;
    }
    if (!status2.isGranted) {
      await Permission.storage.status;
    }
    if (!status3.isGranted) {
      await Permission.accessMediaLocation.status;
    }
    // if (status) {
    //   if (await Permission.accessMediaLocation.request().isGranted) {
    //     printInfo(info: status.toString());
    //     if (await Permission.storage.request().isGranted) {
    //       printInfo(info: status.toString());

    //       if (await Permission.manageExternalStorage.request().isGranted) {
    //         printInfo(info: status.toString());
    //       } else {
    //         // openAppSettings();
    //       }
    //     } else {
    //       // openAppSettings();
    //     }
    //     // await Permission.manageExternalStorage.request();
    //   } else {
    //     // openAppSettings();
    //   }
    // }
    // var statuss = await Permission.storage.status;
    // if (statuss.isPermanentlyDenied) {
    //   // You can request multiple permissions at once.
    // Map<Permission, PermissionStatus> statuses = await [
    //   Permission.manageExternalStorage,
    //   Permission.accessMediaLocation,
    // ].request();
    //   print(statuses[
    //       Permission.storage]); // it should print PermissionStatus.granted
    // }
  }
}
