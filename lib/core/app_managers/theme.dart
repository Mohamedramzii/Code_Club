import 'package:flutter/material.dart';
import 'package:job_app/core/app_managers/colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
   brightness: Brightness.light,
  // primaryColor: ColorsManager.KprimaryColor,
  colorScheme: ColorScheme.light(
      primary: ColorsManager.KprimaryColor,
      secondary: ColorsManager.KprimaryColor,),
   

);
ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    // backgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(
        primary: ColorsManager.KprimaryColor,
        secondary: ColorsManager.KprimaryColor)
    // navigationBarTheme: NavigationBarThemeData(
    //   backgroundColor: Colors.black,
    // ),
    );
