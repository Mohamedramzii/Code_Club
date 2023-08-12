// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Add A Project`
  String get addAProject {
    return Intl.message(
      'Add A Project',
      name: 'addAProject',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get Welcome_Back {
    return Intl.message(
      'Welcome Back',
      name: 'Welcome_Back',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Welcome_Back!_please_enter_your_details' key

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get Enter_your_email {
    return Intl.message(
      'Enter your email',
      name: 'Enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get Enter_your_password {
    return Intl.message(
      'Enter your password',
      name: 'Enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Forgot_password?' key

  /// `Sign In`
  String get Sign_In {
    return Intl.message(
      'Sign In',
      name: 'Sign_In',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get Username {
    return Intl.message(
      'Username',
      name: 'Username',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Username`
  String get Enter_your_Username {
    return Intl.message(
      'Enter your Username',
      name: 'Enter_your_Username',
      desc: '',
      args: [],
    );
  }

  /// `Include a short title that accurately describes your project.`
  String get short_title {
    return Intl.message(
      'Include a short title that accurately describes your project.',
      name: 'short_title',
      desc: '',
      args: [],
    );
  }

  /// `Project Related Skills`
  String get Project_Related_Skills {
    return Intl.message(
      'Project Related Skills',
      name: 'Project_Related_Skills',
      desc: '',
      args: [],
    );
  }

  /// `Determine the most important skills required to implement your project.`
  String get important_skills_required {
    return Intl.message(
      'Determine the most important skills required to implement your project.',
      name: 'important_skills_required',
      desc: '',
      args: [],
    );
  }

  /// `Detaild Description`
  String get Detaild_Description {
    return Intl.message(
      'Detaild Description',
      name: 'Detaild_Description',
      desc: '',
      args: [],
    );
  }

  /// `Include a detailed and accurate description of your project.`
  String get description {
    return Intl.message(
      'Include a detailed and accurate description of your project.',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Project Budget`
  String get Project_Budget {
    return Intl.message(
      'Project Budget',
      name: 'Project_Budget',
      desc: '',
      args: [],
    );
  }

  /// `Choose a suitable budget to get good deals`
  String get Choose_a_suitable_budget_to_get_good_deals {
    return Intl.message(
      'Choose a suitable budget to get good deals',
      name: 'Choose_a_suitable_budget_to_get_good_deals',
      desc: '',
      args: [],
    );
  }

  /// `Expected Delivery Time (In Days)`
  String get Expected_Delivery_Time {
    return Intl.message(
      'Expected Delivery Time (In Days)',
      name: 'Expected_Delivery_Time',
      desc: '',
      args: [],
    );
  }

  /// `When do you need to receive your project?`
  String get When_to_receive {
    return Intl.message(
      'When do you need to receive your project?',
      name: 'When_to_receive',
      desc: '',
      args: [],
    );
  }

  /// `Design`
  String get Design {
    return Intl.message(
      'Design',
      name: 'Design',
      desc: '',
      args: [],
    );
  }

  /// `Management`
  String get Management {
    return Intl.message(
      'Management',
      name: 'Management',
      desc: '',
      args: [],
    );
  }

  /// `Programming`
  String get Programming {
    return Intl.message(
      'Programming',
      name: 'Programming',
      desc: '',
      args: [],
    );
  }

  /// `Job category`
  String get Job_category {
    return Intl.message(
      'Job category',
      name: 'Job_category',
      desc: '',
      args: [],
    );
  }

  /// `Choose a category which fits your job vacancy`
  String get choose_category_fit {
    return Intl.message(
      'Choose a category which fits your job vacancy',
      name: 'choose_category_fit',
      desc: '',
      args: [],
    );
  }

  /// `Choose a category`
  String get choose_a_category {
    return Intl.message(
      'Choose a category',
      name: 'choose_a_category',
      desc: '',
      args: [],
    );
  }

  /// `Attach File`
  String get attach {
    return Intl.message(
      'Attach File',
      name: 'attach',
      desc: '',
      args: [],
    );
  }

  /// `Post Now`
  String get post_now {
    return Intl.message(
      'Post Now',
      name: 'post_now',
      desc: '',
      args: [],
    );
  }

  /// `App Settings`
  String get Settings {
    return Intl.message(
      'App Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get Theme {
    return Intl.message(
      'Theme',
      name: 'Theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get Dark {
    return Intl.message(
      'Dark',
      name: 'Dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get Light {
    return Intl.message(
      'Light',
      name: 'Light',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Ar {
    return Intl.message(
      'Arabic',
      name: 'Ar',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get En {
    return Intl.message(
      'English',
      name: 'En',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get Website {
    return Intl.message(
      'Website',
      name: 'Website',
      desc: '',
      args: [],
    );
  }

  /// `phone`
  String get Phone {
    return Intl.message(
      'phone',
      name: 'Phone',
      desc: '',
      args: [],
    );
  }

  /// `Joined at`
  String get joined {
    return Intl.message(
      'Joined at',
      name: 'joined',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get information {
    return Intl.message(
      'Information',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Add A Skill`
  String get add_skills {
    return Intl.message(
      'Add A Skill',
      name: 'add_skills',
      desc: '',
      args: [],
    );
  }

  /// `Skills`
  String get skills {
    return Intl.message(
      'Skills',
      name: 'skills',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
