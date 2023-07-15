// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/core/app_managers/fonts.dart';

abstract class CustomDialog {
  static ShowDialog(
      {required context,
      required TextEditingController controller,
      //  String data,
      required String whatToUpdate,
      required void Function() onpressed}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                        onPressed: () {
                          controller.clear();
                          Navigator.pop(context);
                        },
                        color: Colors.red,
                        shape: const StadiumBorder(),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        )),
                    MaterialButton(
                        onPressed: onpressed,
                        color: Colors.green,
                        shape: const StadiumBorder(),
                        child: const Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                )
              ],
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
              backgroundColor: Colors.white,
              title: Text(
                'Edit your data',
                style: FontManager.text25,
                textAlign: TextAlign.center,
              ),
              content: SizedBox(
                width: 300.w,
                child: TextField(
                  controller: controller,
                  onSubmitted: (value) {
                    controller.text = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Update Your $whatToUpdate',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r))),
                ),
              ),
            ));
  }
}
