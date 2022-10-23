

 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../public/colors_custom.dart';
import '../../../public/heading_text.dart';

folderText({
   required String txt,
  IconData? icon,
 }){
  return Padding(
    padding: const EdgeInsets.only(left: 20, bottom: 15),
    child: Row(
      children: [
        Icon(icon, color: CustomColor.blue,),
        SizedBox(width: Get.width*0.03,),
        myText(text: txt, color: CustomColor.blue )
      ],
    ),
  );
 }