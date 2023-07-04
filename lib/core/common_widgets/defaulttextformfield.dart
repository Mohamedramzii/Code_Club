import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/app_managers/fonts.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    Key? key,
    required this.textfieldHeadername,
    required this.hinttext,
    required this.controller,
    required this.isPassword,
    required this.textInputType,
    required this.onsave,
    required this.onvalidate,
  }) : super(key: key);
  final String textfieldHeadername;
  final String hinttext;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType textInputType;
  final FormFieldSetter<String> onsave;
  final FormFieldValidator<String> onvalidate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 0.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textfieldHeadername,
            style: FontManager.blacktext15,
            textAlign: TextAlign.end,
          ),
          SizedBox(
            height: 33.h,
            child: TextFormField(
              controller: controller,
              onSaved: onsave,
              validator: onvalidate,
              obscureText: isPassword,
              keyboardType: textInputType,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                hintText: hinttext,
                hintStyle: FontManager.greytext15,
                // isCollapsed: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: ColorsManager.KTextFormFieldColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: ColorsManager.KTextFormFieldColor)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: ColorsManager.KTextFormFieldColor)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
