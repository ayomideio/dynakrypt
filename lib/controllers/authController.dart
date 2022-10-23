import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:dynakrypt/AppModule/WelcomeScreen/welcomeScreen.dart';
import 'package:dynakrypt/AppModule/auth_screen/userInformation.dart';
import 'package:dynakrypt/AppModule/homePage/menuPage.dart';
import 'package:dynakrypt/controllers/drawerController.dart';
import 'package:dynakrypt/controllers/encryptController.dart';
import 'package:permission_handler/permission_handler.dart';

// var box=Hive.box('userDetails');

import '../AppModule/auth_screen/loginType.dart';
import '../main.dart';

class AuthCtrl extends GetxController {
  RxBool character = false.obs;
  Rx<TypeLogin> type = TypeLogin.Type1.obs;
  // late RxBool isLoggedIn;
  // String type = '';
  // String secret = '';
  // String name = '', password = '', secretKey = '';

  TextEditingController nameCtrl = TextEditingController(),
      passwordCtrl = TextEditingController(),
      secretKeyCtrl = TextEditingController();

  TextEditingController rrnameCtrl = TextEditingController(),
      rrpasswordCtrl = TextEditingController(),
      rrsecretKeyCtrl = TextEditingController();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    // prefs = await SharedPreferences.getInstance();
    // askPermission();
  }

  void updateCharacter(bool c) async {
    type.value = c ? TypeLogin.Type2 : TypeLogin.Type1;
    await box.put(nameCtrl.text + secretKeyCtrl.text + nameCtrl.text, c);
    character.value = c;
    update();
  }

  Future<bool> signIn(
      {required String name,
      required String password,
      // required bool type,
      required String secret}) async {
    printInfo(info: name + password + secret);

    String n = box.get(
          name + '1' + secret + '1',
        ) ??
        "";
    String p = box.get(
          name + '1' + password + '2',
        ) ??
        "";
    String sK = box.get(
          secret + '2' + name + '1',
        ) ??
        "";
    // bool t = box.getBool(
    //       name + secret + name,
    //     ) ??
    //     false;

    if (name == n && password == p && secret == sK) {
      // character.value = box.getBool(name + secret + name)!;
      // update();
      int lg =
          box.get(name + '000' + name + '222' + name + '444', defaultValue: 0);
      lg++;

      await box.put(name + '000' + name + '222' + name + '444', lg);
      // await box.setBool('currentType', character.value);
      // printInfo(
      //     info: "value of character from controller" +
      //         character.value.toString());
      await box.put('currentUser', name);
      nameCtrl.text = '';
      passwordCtrl.text = '';
      secretKeyCtrl.text = '';
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signUp(
      {required String name,
      required String password,
      required String secret}) async {
    printInfo(info: name + password + secret);
    await box.put(name + '1' + secret + '1', name);
    await box.put(name + '1' + password + '2', password);
    await box.put(secret + '2' + name + '1', secret);
    await box.put(name + '000' + name + '222' + name + '444', 0);

    // character.value = box.getBool(name + secret + name) ?? false;
    await box.put('currentUser', name);

    return true;
  }

  Future<bool> setTypeOfUser() async {
    Directory directory = Directory('storage/emulated/0/Dynakrypt');
    if (!await directory.exists()) {
      directory.create();
    }
    await box.put(
        rrnameCtrl.text +
            '1' +
            rrsecretKeyCtrl.text +
            '2' +
            rrnameCtrl.text +
            '3',
        character.value);
    await box.put('currentType', character.value);
    if (character.value) {
      Get.offAll(MenuScreen());
    } else {
      Get.to(UserInformation(
        one: 2,
      ));
    }

    return true;
  }

  // Future<bool> setType() async {
  //   character.value == TypeLogin.Type1
  //       ? await box.setString('type', '1')
  //       : await box.setString('type', '2');
  //   return true;
  // }
}
