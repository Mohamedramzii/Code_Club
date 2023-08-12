import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_app/core/app_managers/colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  // primaryColor: ColorsManager.KprimaryColor,
  colorScheme: ColorScheme.light(
    primary: ColorsManager.KprimaryColor,
    secondary: ColorsManager.KprimaryColor,
  ),
  textTheme: TextTheme(
    titleMedium: GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: 25.sp, fontWeight: FontWeight.bold, color: Colors.black)),
  ),
);
ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  // backgroundColor: Colors.black,
  colorScheme: ColorScheme.dark(
      primary: ColorsManager.KprimaryColor,
      secondary: ColorsManager.KprimaryColor),
  textTheme: TextTheme(
    titleMedium: GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: 25.sp, fontWeight: FontWeight.bold, color: Colors.white)),
  ),
  // navigationBarTheme: NavigationBarThemeData(
  //   backgroundColor: Colors.black,
  // ),
);
