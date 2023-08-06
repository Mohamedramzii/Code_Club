import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/constants.dart';
import 'package:job_app/core/helpers/local/cache_helper.dart';

abstract class FontManager {
  static TextStyle text25 = GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
          color: CacheHelper.getData(key: themeKey)
              ? Colors.white
              : Colors.black));
  static TextStyle greytext15 = GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 15.sp, fontWeight: FontWeight.w500, color: Colors.grey));
  static TextStyle blacktext15 = GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: CacheHelper.getData(key: themeKey)
              ? Colors.white
              : Colors.black));
  static TextStyle greytext12 = GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.grey));
  static TextStyle blacktext12 = GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: CacheHelper.getData(key: themeKey)
              ? Colors.white
              : Colors.black));
  static TextStyle purpletext10 = GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.KprimaryColor));
  static TextStyle text10 = GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.ksometextsColor));
}
