import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/drawerController.dart';
import 'heading_text.dart';

Widget customAppbar({
  required String text,
  double size = 25,
}) {
  return Container(
    height: Get.height * 0.135,
    width: Get.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        color: Color.fromRGBO(75, 90, 224, 1)),
    child: Column(
      children: [
        SizedBox(
          height: Get.height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.only(left: Get.width * 0.25),
          child: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logo1.png'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: Get.width * 0.05,
              ),
              myText(
                text: "DynaKrypt ",
                color: Colors.white,
                size: 20,
                fontweight: FontWeight.w800,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Get.width * 0.05,
            top: Get.height * 0.015,
          ),
          child: myText(
              text: text,
              color: Colors.white,
              fontweight: FontWeight.w600,
              size: size),
        ),
      ],
    ),
  );
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  String text;
  double size;
  bool show;
  CustomAppBar({
    this.show = true,
    this.size = 25,
    required this.text,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      width: Get.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        color: Color.fromRGBO(
          75,
          90,
          224,
          1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: !show
                        ? Container()
                        : Icon(
                            Icons.view_headline_outlined,
                            color: Colors.white,
                          )),
              ),
              SizedBox(
                width: Get.width / 7,
              ),
              Stack(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/logo1.png'),
                            fit: BoxFit.cover)),
                  ),
                  text == 'DynaKrypt'
                      ? Row(
                          children: [
                            SizedBox(
                              width: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: myText(
                                text: 'DynaKrypt \n Mission Impossible',
                                color: Colors.white,
                                size: 20,
                                fontweight: FontWeight.w800,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: text.length.isGreaterThan(10)
                                    ? Get.width * 0.05
                                    : text.length.isGreaterThan(5)
                                        ? Get.width * 0.1
                                        : Get.width * 0.15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: text.length.isGreaterThan(10)
                                          ? 40
                                          : 0),
                                  child: myText(
                                    text: 'DynaKrypt',
                                    color: Colors.white,
                                    size: 20,
                                    fontweight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height / 100,
                                ),
                                myText(
                                    text: text,
                                    color: Colors.white,
                                    fontweight: FontWeight.w600,
                                    size: size),
                              ],
                            )
                          ],
                        ),
                ],
              ),
              Container()
            ],
          ),
          Container()
        ],
      ),
    );
  }
}

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  double size;
  CustomAppBar2({
    this.size = 25,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: preferredSize.height,
        width: Get.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          color: Color.fromRGBO(
            75,
            90,
            224,
            1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 55.0, top: 8),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo1.png'),
                          fit: BoxFit.cover)),
                ),
                myText(
                  text: 'DynaKrypt',
                  color: Colors.white,
                  size: 20,
                  fontweight: FontWeight.w800,
                ),
              ]),
        ));
  }
}

class EncryptAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  String text;
  double size;
  bool show;
  EncryptAppbar({
    this.show = true,
    this.size = 25,
    required this.text,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      width: Get.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        color: Color.fromRGBO(
          75,
          90,
          224,
          1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: !show
                        ? Container()
                        : Icon(
                            Icons.view_headline_outlined,
                            color: Colors.white,
                          )),
              ),
              SizedBox(
                width: Get.width / 7,
              ),
              Stack(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/logo1.png'),
                            fit: BoxFit.cover)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: Get.width * 0.11),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: Get.height / 120),
                            child: myText(
                              text: 'DynaKrypt',
                              color: Colors.white,
                              size: 20,
                              fontweight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: Get.height / 100,
                          ),
                          myText(
                              text: text,
                              color: Colors.white,
                              fontweight: FontWeight.w600,
                              size: size),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Container()
            ],
          ),
          Container()
        ],
      ),
    );
  }
}

class NotesAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  String text;
  double size;
  bool show;
  NotesAppbar({
    this.show = true,
    this.size = 25,
    required this.text,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      width: Get.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        color: Color.fromRGBO(
          75,
          90,
          224,
          1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(
                      Icons.view_headline_outlined,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                width: Get.width / 7,
              ),
              Stack(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/logo1.png'),
                            fit: BoxFit.cover)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: Get.width * 0.15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: Get.height / 100),
                            child: myText(
                              text: 'DynaKrypt',
                              color: Colors.white,
                              size: 20,
                              fontweight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: Get.height / 100,
                          ),
                          myText(
                              text: text,
                              color: Colors.white,
                              fontweight: FontWeight.w600,
                              size: size),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Container()
            ],
          ),
          Container()
        ],
      ),
    );
  }
}

class AboutUsAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  String text;
  double size;
  bool show;
  AboutUsAppbar({
    this.show = true,
    this.size = 25,
    required this.text,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      width: Get.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        color: Color.fromRGBO(
          75,
          90,
          224,
          1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(
                      Icons.view_headline_outlined,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                width: Get.width / 7,
              ),
              Stack(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/logo1.png'),
                            fit: BoxFit.cover)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: Get.width * 0.15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: Get.height / 100),

                            // const EdgeInsets.all(8.0),
                            child: myText(
                              text: 'DynaKrypt',
                              color: Colors.white,
                              size: 20,
                              fontweight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: Get.height / 100,
                          ),
                          myText(
                              text: text,
                              color: Colors.white,
                              fontweight: FontWeight.w600,
                              size: size),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Container()
            ],
          ),
          Container()
        ],
      ),
    );
  }
}

class EncryptionHistoryAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final double height;
  String text;
  double size;
  bool show;
  EncryptionHistoryAppbar({
    this.show = true,
    this.size = 25,
    required this.text,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      width: Get.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        color: Color.fromRGBO(
          75,
          90,
          224,
          1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(
                      Icons.view_headline_outlined,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                width: Get.width / 7,
              ),
              Stack(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/logo1.png'),
                            fit: BoxFit.cover)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: Get.width * 0.004),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: Get.height / 100),
                            child: myText(
                              text: 'DynaKrypt',
                              color: Colors.white,
                              size: 20,
                              fontweight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: Get.height / 100,
                          ),
                          myText(
                              text: text,
                              color: Colors.white,
                              fontweight: FontWeight.w600,
                              size: size),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Container()
            ],
          ),
          Container()
        ],
      ),
    );
  }
}
