
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void showRedToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.orange,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void showGreenToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
