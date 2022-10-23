

  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../public/colors_custom.dart';

customBottomBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.check_circle_outline_rounded, color: CustomColor.blue,),
        Icon(Icons.add_circle_outline_sharp, color: CustomColor.blue),
        Icon(Icons.delete_outline_sharp, color: CustomColor.blue),
        Icon(Icons.drive_folder_upload_outlined, color: CustomColor.blue),
      ],
    ),
  );
  }