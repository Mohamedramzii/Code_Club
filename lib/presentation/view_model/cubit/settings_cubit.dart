import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:job_app/core/constants.dart';
import 'package:job_app/core/helpers/local/cache_helper.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  bool _isDark = false;
  bool get isDark => _isDark;

   chanegTheme() {
    _isDark = !_isDark;
    CacheHelper.saveData(key: themeKey, value: isDark);
    // print(isDark);
    emit(ThemeChanged());
    // return _isDark;
  }

  // ThemeMode _themeMode = ThemeMode.light;
  // get themeMode => _themeMode;

  // toggleTheme(bool isDark) {
  //   _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  //   emit(ThemeChanged());
  // }
}
