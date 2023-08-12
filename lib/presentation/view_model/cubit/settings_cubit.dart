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

  chanegTheme() async {
    _isDark = !_isDark;

    print(isDark);
    emit(ThemeChanged());
    await CacheHelper.saveData(key: themeKey, value: isDark);
    // return _isDark;
  }

  bool currentTheme() {
    return _isDark = CacheHelper.getData(key: themeKey);
  }

  // bool currentTheme = false;
  void switchThemeToggle(bool value) async {
    _isDark = value;
    // _isDark = !_isDark;

    print('**-*--*-*-*-*-* isDark $isDark');
    emit(SwitchToggleSuccessState());
    await CacheHelper.saveData(key: themeKey, value: isDark);
  }

  bool isEn = false;
  void switchLanguageToggle(bool value) async {
    isEn = value;
    print('*-*-*-*-* isEn $isEn');
    emit(SwitchToggleLanguageSuccessState());
    await CacheHelper.saveData(key: langKey, value: isEn);
  }

  bool currentLanguage() {
    return isEn = CacheHelper.getData(key: langKey) ?? false;
  }
}
