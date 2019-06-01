import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class UtilWidgets {
  static void showSnackBar(ScaffoldState state, String title, Duration duration,
      SnackBarAction snackbarAction) {
    state.showSnackBar(SnackBar(
      duration: duration,
      content: Text(
        title,
      ),
      action: snackbarAction,
    ));
  }

  static void showToast(String msg,
      {BuildContext context, int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
