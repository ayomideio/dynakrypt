import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'colors_custom.dart';

customTextField({
  required String hintText,
  required TextEditingController ctrl,
  bool isPassword = false,
}) {
  return SizedBox(
    height: Get.height * 0.06,
    child: TextField(
      controller: ctrl,
      textAlignVertical: TextAlignVertical.center,
      obscureText: isPassword,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          hintText: hintText,
          hintStyle: TextStyle(color: CustomColor.blue),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.blue),
            borderRadius: BorderRadius.circular(10),
          )),
    ),
  );
}
