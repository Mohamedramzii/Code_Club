part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}
class ThemeChanged extends SettingsState {}
class SwitchToggleSuccessState extends SettingsState {}
class SwitchToggleLanguageSuccessState extends SettingsState {}


