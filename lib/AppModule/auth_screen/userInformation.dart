
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dynakrypt/AppModule/auth_screen/loginType.dart';
import 'package:dynakrypt/AppModule/drawerr/drawerScreen.dart';
import 'package:dynakrypt/AppModule/homePage/menuPage.dart';
import 'package:dynakrypt/AppModule/public/customAppBar.dart';
import 'package:dynakrypt/AppModule/public/customTextField.dart';
import 'package:dynakrypt/AppModule/public/custom_button.dart';
import 'package:dynakrypt/models/users.dart';
import '../../controllers/authController.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserInformation extends StatelessWidget {
  UserInformation({Key? key, this.one = 1}) : super(key: key);
  var ctrl = Get.find<AuthCtrl>();
  int one;


  @override
  void initState() {


    // Create anonymous function:
        () async {
          await openDatabase(
              join(await getDatabasesPath(), 'dynakrypt1.db'),

              onCreate: (db,version)async{
                await db.execute(
                  'CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT,secretcode TEXT)',
                ); },
              version: 1
          );
          print("i ran the init");

    } ();
  }


  @override
  Widget build(BuildContext context) {

    ctrl.nameCtrl.clear();
    ctrl.passwordCtrl.clear();
    ctrl.secretKeyCtrl.clear();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            customAppbar(text: 'Log in'),
            SizedBox(
              height: Get.height / 6,
            ),
            Container(
              width: 300,
              height: 39,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(158, 75, 224, 1),
                    Color.fromRGBO(40, 166, 225, 1)
                  ]),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white24,
                        blurRadius: 5,
                        spreadRadius: 5,
                        offset: Offset(1, 0))
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                  onPressed: () {},
                  height: 39,
                  // color: Colors.blue,
                  child: Center(
                      child: Text(
                    'User Information',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: Get.width * 0.045,
                    ),
                  )),
                ),
              ),
            ),
            // customButton(
            //     text: 'User Information',
            //     width: 136,
            //     height: 40,
            //     textFont: Get.height * 0.012),
            Container(
              height: Get.height * 0.3,
              width: Get.width - 30,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(-2, 10))
                  ]),
              child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    children: [
                      customTextField(hintText: 'Name', ctrl: ctrl.nameCtrl),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      customTextField(
                          hintText: 'Password',
                          ctrl: ctrl.passwordCtrl,
                          isPassword: true),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      customTextField(
                          hintText: 'Secret code', ctrl: ctrl.secretKeyCtrl),
                    ],
                  )),
            ),
            SizedBox(
              height: Get.height / 6,
            ),
            customButton(
                text: 'Log In',
                width: Get.width * 0.85,
                function: () async {
                  await openDatabase(
                      join(await getDatabasesPath(), 'dynakrypt1.db'),

                      onCreate: (db,version)async{
                        await db.execute(
                          'CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT,secretcode TEXT)',
                        ); },
                      version: 1
                  );
                  if (ctrl.nameCtrl.text.isNotEmpty &&
                      ctrl.secretKeyCtrl.text.isNotEmpty &&
                      ctrl.passwordCtrl.text.isNotEmpty) {
                    final database=await openDatabase(
                        join(await getDatabasesPath(), 'dynakrypt1.db'),

                        onCreate: (db,version)async{
                          await db.execute(
                            'CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT,secretcode TEXT)',
                          ); },
                        version: 1
                    );
                    Future <void> createUser(User user)async{
                      final db=await database;
                      await db.insert(
                          'users',
                          user.toMap(),
                          conflictAlgorithm: ConflictAlgorithm.replace
                      );
                    }
                    final dbd=await database;
                    var demoAcc= User(id: 1, username:"Test", password: "Test", secretcode: "Test");
                    await createUser(demoAcc);
                    final List<Map<String, dynamic>> maps = await dbd.query('users');
                    for (var createdUser in maps){print("created userr");
                    print(createdUser['username']);
                    if(createdUser["username"]==ctrl.nameCtrl.text){
                      if(createdUser['password']==ctrl.passwordCtrl.text){
await ctrl.signUp(name:createdUser["username"] , password: createdUser["username"], secret: createdUser["username"]).then((value) {
  if (value) {

    ctrl.rrnameCtrl.clear();
    ctrl.rrpasswordCtrl.clear();
    ctrl.rrsecretKeyCtrl.clear();
    ctrl.nameCtrl.clear();
    ctrl.passwordCtrl.clear();
    ctrl.secretKeyCtrl.clear();

    // Get.to(UserInformation());
  }
});
;

bool a = await ctrl.signIn(
    name: createdUser['username'],
    password: createdUser['username'],
    secret: createdUser['username']);
a
    ? one == 1
    ? Get.to(LoginType())
    : Get.offAll(MenuScreen())
    : Get.snackbar('Sorry',
    'No user registered with this credentials');

                      }
                      else{
                        bool a = await ctrl.signIn(
                            name: ctrl.nameCtrl.text,
                            password: ctrl.passwordCtrl.text,
                            secret: ctrl.secretKeyCtrl.text);
                        a
                            ? one == 1
                            ? Get.to(LoginType())
                            : Get.offAll(MenuScreen())
                            : Get.snackbar('Sorry',
                            'No user registered with this credentials');
                      }
                    }
                    else{
                      bool a = await ctrl.signIn(
                          name: ctrl.nameCtrl.text,
                          password: ctrl.passwordCtrl.text,
                          secret: ctrl.secretKeyCtrl.text);
                      a
                          ? one == 1
                          ? Get.to(LoginType())
                          : Get.offAll(MenuScreen())
                          : Get.snackbar('Sorry',
                          'No user registered with this credentials');
                    }
                    }


                  } else {
                    Get.snackbar(
                        'Empty Fields', 'Please provide all the fields');
                  }
                  // await ctrl
                  //     .signIn(
                  //         name: ctrl.nameCtrl.text,
                  //         password: ctrl.passwordCtrl.text,
                  //         secret: ctrl.secretKeyCtrl.text)
                  //     .then((value) {
                  //   if (value) {
                  // Get.to(LoginType());
                  // }
                  // });
                })
          ],
        ),
      ),
    );
  }
}


