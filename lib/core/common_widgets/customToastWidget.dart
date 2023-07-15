import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class Toast {
  static successToast({
    required String text,
  }) {
    Fluttertoast.showToast(
        msg: text, backgroundColor: Colors.green, gravity: ToastGravity.BOTTOM);
  }

  static failureToast({
    required String text,
  }) {
    Fluttertoast.showToast(
        msg: text, backgroundColor: Colors.red, gravity: ToastGravity.BOTTOM);
  }
}
