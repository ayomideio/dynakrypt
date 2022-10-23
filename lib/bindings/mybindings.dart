import 'package:get/get.dart';
import 'package:dynakrypt/controllers/authController.dart';
import 'package:dynakrypt/controllers/drawerController.dart';
import 'package:dynakrypt/controllers/encryptController.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EncryptController(), fenix: true);
    Get.lazyPut(() => DrawerControllerr(), fenix: true);

    Get.lazyPut(() => AuthCtrl());
  }
}
