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
    required this.textinputaction,
    required this.onsave,
    required this.onvalidate,
    this.height,
    this.onsubmit,
  }) : super(key: key);
  final String textfieldHeadername;
  final String hinttext;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType textInputType;
  final TextInputAction textinputaction;
  final FormFieldSetter<String> onsave;
  final FormFieldValidator<String> onvalidate;
  final double? height;

  final Function(String)? onsubmit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textfieldHeadername,
            style: FontManager.blacktext15,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: height,
          ),
          SizedBox(
            height: 50.h,
            child: TextFormField(
              // autovalidateMode: AutovalidateMode.disabled,
              textInputAction: textinputaction,
              controller: controller,
              onSaved: onsave,
              validator: onvalidate,
              onFieldSubmitted: onsubmit,
              obscureText: isPassword,
              keyboardType: textInputType,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                hintText: hinttext,
                hintStyle: FontManager.greytext15,
                // isCollapsed: true,
                disabledBorder: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: ColorsManager.KTextFormFieldColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: ColorsManager.KprimaryColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
