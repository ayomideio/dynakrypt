import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import 'colors_custom.dart';
// ignore_for_file: prefer_const_constructors
Widget customButton(
    {double width = 300,
    double height = 39,
    required String text,
    Callback? function,
      double textFont= 15,
    //required Color color,
    Color textColor = Colors.white}) {
  return Container(
    width:  width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(158, 75, 224, 1),
          Color.fromRGBO(40, 166, 225, 1)
        ]),
          borderRadius: BorderRadius.circular(5),
        boxShadow:  const [
          BoxShadow(
            color: Colors.white24,
            blurRadius: 5,
            spreadRadius: 5,
            offset: Offset(1,0)
          )
        ]
          ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        onPressed: function,
        height: height,
       // color: Colors.blue,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: textFont,),
        )),
      ),
    ),
  );
  //   InkWell(
  //   onTap: function,
  //
  //   child: Container(
  //     width: width,
  //     height: height,
  //     decoration: BoxDecoration(
  //       color: color,
  //       borderRadius: BorderRadius.circular(16),
  //       border: Border.all(
  //         color: CustomColor.primaryButtonColor,
  //       )
  //     ),
  //     child: Center(
  //         child: Text(
  //       text,
  //       style:TextStyle(
  //           color:textColor, fontSize: 15, fontFamily: 'Poppins'),
  //     )),
  //   ),
  // );
}
