// Path: lib/core/ui/dialogs.dart
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:overlay_support/overlay_support.dart' hide Toast;

class DialogUtils {
  static void showError(
      BuildContext context, String title, String description) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      title: title,
      desc: description,
      btnOkOnPress: () {},
      btnOkColor: Colors.red,
    ).show();
  }

  static void showSuccess(
      BuildContext context, String title, String description) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: title,
      desc: description,
      btnOkOnPress: () {},
    ).show();
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
    );
  }

  static void showInAppNotification(String title, String message,
      {Color color = Colors.blue}) {
    showSimpleNotification(
      Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message),
      background: color,
      duration: const Duration(seconds: 3),
      slideDismissDirection: DismissDirection.up,
    );
  }
}
