import 'package:device_info/device_info.dart';
import 'package:dynakrypt/AppModule/SplashScreen/splashScreen.dart';
import 'package:dynakrypt/AppModule/auth_screen/loginType.dart';
import 'package:dynakrypt/AppModule/auth_screen/signUp.dart';
import 'package:dynakrypt/AppModule/auth_screen/userInformation.dart';
import 'package:dynakrypt/AppModule/drawerr/drawerScreen.dart';
import 'package:dynakrypt/AppModule/homePage/encrypted/encrypted.dart';
import 'package:dynakrypt/AppModule/homePage/encryptedHistory/encryptedHistory.dart';
import 'package:dynakrypt/AppModule/homePage/menuPage.dart';
import 'package:dynakrypt/bindings/mybindings.dart';
import 'package:dynakrypt/models/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart' as h;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:purchases_flutter/models/purchases_configuration.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:sqflite/sqflite.dart';

Future _localPath() async {
  final directory = await getApplicationDocumentsDirectory();
  print("directoryy pathh");
  print("...........");
  print(directory.path);
  print("...........");
}

late Box box;
Future<String> initPlatformState() async {
  final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
  var deviceId;
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    deviceId = await deviceInfoPlugin.iosInfo;
    print(deviceId.identifierForVendor);
  } on PlatformException {
    deviceId = 'Failed to get deviceId.';
  }

  return deviceId.identifierForVendor.toString();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _configuration =
      PurchasesConfiguration("appl_nqDEERSHcsemkVXfdnUqvJerdsr");
  final devId = await initPlatformState();
  await Purchases.configure(_configuration..appUserID = devId);
  await _localPath();
  final database =
      await openDatabase(join(await getDatabasesPath(), 'dynakrypt1.db'),
          onCreate: (db, version) async {
    await db.execute(
      'CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT,secretcode TEXT)',
    );
  }, version: 1);
  Future<void> createUser(User user) async {
    final db = await database;
    await db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  final dbd = await database;

  var demoAcc =
      const User(id: 1, username: "Test", password: "Test", secretcode: "Test");

  demoAcc = User(
      id: demoAcc.id, username: "Test", password: "Test", secretcode: "Test");
  final List<Map<String, dynamic>> maps = await dbd.query('users');
  for (var createdUser in maps) {
    print("created userr");
    print(createdUser['username']);
  }

  if (maps.length < 1) {
    await createUser(demoAcc);
  } else {
    print("i have the data");
  }

  MyBindings().dependencies();
  await Hive.initFlutter();
  box = await h.Hive.openBox('userDetails');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/encrypted', page: () => EncryptedScreen()),
        GetPage(name: '/encryptedhistory', page: () => EncryptedHistory()),
        GetPage(name: '/drawerscreen', page: () => DrawerScreen()),
        GetPage(name: '/menuscreen', page: () => MenuScreen()),
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => UserInformation()),
        GetPage(name: '/logintype', page: () => LoginType()),
        GetPage(name: '/signup', page: () => SignUpScreen())
      ],
      title: 'DynaKrypt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'San-Francisco-Font',
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
