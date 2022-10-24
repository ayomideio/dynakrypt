// ignore_for_file: prefer_const_constructors

import 'package:dynakrypt/AppModule/auth_screen/signUp.dart';
import 'package:dynakrypt/AppModule/auth_screen/userInformation.dart';
import 'package:dynakrypt/AppModule/public/colors_custom.dart';
import 'package:dynakrypt/AppModule/public/custom_button.dart';
import 'package:dynakrypt/AppModule/public/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../public/heading_text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isSubscribed = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    printInfo(info: 'permissions');

    askPermission();

    Purchases.addCustomerInfoUpdateListener(
      (_) => UpdateCustomerStatus(),
    );
    UpdateCustomerStatus();
  }

  void askPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.manageExternalStorage,
      Permission.storage,
    ].request();
  }

  Future<void> PurchaseProduct() async {
    await fetchOffers();
    // await Purchases.purchaseProduct("dynakrypt");
  }

  Future<void> UpdateCustomerStatus() async {
    final customerInfo = await Purchases.getCustomerInfo();
    customerInfo.entitlements.active['Monthly'];
    setState(() {
      final entitlement = customerInfo.entitlements.active['Monthly'];
      isSubscribed = entitlement != null;
    });
  }

  Future subscribe() async {
    !isSubscribed
        ? showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.blueAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dynakrypt offers file encryption and decryption feature,you must subscribe to access all in app features.",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff6A74CF),
                            border: Border.all(
                              color: Color(0xff6A74CF),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextButton(
                          onPressed: () async {
                            await fetchOffers();
                          },
                          child: Text(
                            'Proceed 25\$/Month',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ));
            },
          )
        : null;
  }

  Future fetchOffers() async {
    final offerings = await Purchases.getOfferings();
    if (offerings.current != null) {
      final packages = offerings.current!.availablePackages;
      print("packages $packages");

      await Purchases.purchaseProduct("dynakrypt");
      for (var package in packages) {
        print("package ");
        print(package.identifier);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height / 5,
            ),
            Container(
              height: 200,
              width: Get.width - 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo1.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            myText(
                text: 'Welcome To',
                color: Color.fromRGBO(250, 160, 0, 1),
                size: 16),
            GradientText('DynaKrypt',
                gradient: const LinearGradient(colors: [
                  Color.fromRGBO(158, 75, 224, 1),
                  Color.fromRGBO(40, 166, 225, 1),
                ]),
                size: 36),
            SizedBox(
              height: Get.height / 7,
            ),
            customButton(
                text: 'Login',
                function: () =>
                    Get.to(UserInformation()) //Get.to(UserInformation())
                ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            !isSubscribed
                ? customButton(
                    text: 'Subscribe',
                    function: () async {
                      await subscribe();
                    })
                : SizedBox(
                    height: 0,
                  ) //Get.to(UserInformation())
            ,
            SizedBox(
              height: Get.height * 0.01,
            ),
            GestureDetector(
              onTap: () {
                Get.to(SignUpScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myText(text: 'New User? ', color: CustomColor.blue),
                  myText(text: 'Sign Up Instead', color: Colors.grey)
                ],
              ),
            ),
            Expanded(child: Container()),
            myText(
                text: 'Mobile version 2.0'.toUpperCase(),
                color: CustomColor.blue,
                size: 16),
            SizedBox(
              height: Get.height * 0.03,
            )
          ],
        ),
      ),
    );
  }
}

class BottomSnackBar extends StatefulWidget {
  const BottomSnackBar({Key? key}) : super(key: key);

  @override
  State<BottomSnackBar> createState() => _BottomSnackBarState();
}

class _BottomSnackBarState extends State<BottomSnackBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
