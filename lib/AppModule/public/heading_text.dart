import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors_custom.dart';

Widget headingText({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 28,
      fontWeight: FontWeight.w800,
      fontFamily: 'Poppins',
    ),
  );
}

Widget subHeadingText({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
  );
}

Widget subHeadingblack({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
  );
}

Widget subHeadingwhite({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
  );
}

Widget simpleTitleText({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    ),
  );
}

Widget simpleTextGrey({
  required String text,
}) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.grey,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    ),
    textAlign: TextAlign.center,
  );
}

Widget simpleTextprimary({
  required String text,
}) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.blue,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    ),
    textAlign: TextAlign.center,
  );
}

Widget myText({
  int? maxline,
  required String text,
  TextAlign textAlignment = TextAlign.center,
  double size = 15,
  FontWeight fontweight = FontWeight.w500,
  Color color = Colors.black,
}) {
  return Text(
    maxLines: maxline,
    text,
    style: TextStyle(
      color: color,

      fontSize: size,
      overflow: TextOverflow.clip,
      fontWeight: fontweight,
      fontFamily: 'Poppins',
    ),
    textAlign: textAlignment,
  );
}
