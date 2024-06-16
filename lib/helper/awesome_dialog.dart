import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

Future<dynamic> awesomeDialog({
  required BuildContext context,
  required String title,
  required String desc,
  required DialogType dialogType,
}) {
  return AwesomeDialog(
    autoHide: const Duration(seconds: 3),
    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    title: title,
    desc: desc,
    btnOkOnPress: () {},
  ).show();
}
