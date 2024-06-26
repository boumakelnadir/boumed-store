// ignore_for_file: use_build_context_synchronously
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:boumedstore/helper/awesome_dialog.dart';
import 'package:boumedstore/views/sign_in_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> createAcount(
  BuildContext context, {
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.of(context)
        .pushNamedAndRemoveUntil(SignInView.id, (route) => false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Verify Your Email'),
      ),
    );
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      awesomeDialog(
        desc: 'The password provided is too weak.',
        title: 'Info',
        context: context,
        dialogType: DialogType.info,
      );
    } else if (e.code == 'email-already-in-use') {
      awesomeDialog(
        desc: 'The account already exists for that email.',
        title: 'Info',
        context: context,
        dialogType: DialogType.info,
      );
    }
  } catch (e) {
    awesomeDialog(
      desc: e.toString(),
      title: 'Info',
      context: context,
      dialogType: DialogType.info,
    );
  }
}
