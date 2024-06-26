// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:boumedstore/helper/awesome_dialog.dart';
import 'package:boumedstore/views/home.view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> singInAcount(
  BuildContext context, {
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeView.id, (route) => false);
    } else {
      awesomeDialog(
        context: context,
        title: 'verify email',
        desc: 'please verified your email first',
        dialogType: DialogType.info,
      );
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      awesomeDialog(
        desc: 'No user found for that email.',
        title: 'error',
        context: context,
        dialogType: DialogType.error,
      );
    } else if (e.code == 'wrong-password') {
      awesomeDialog(
        desc: 'Wrong password provided for that user.',
        title: 'error',
        context: context,
        dialogType: DialogType.error,
      );
    }
  }
}
