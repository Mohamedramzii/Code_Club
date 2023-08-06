import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/app_managers/theme.dart';

import 'package:job_app/core/constants.dart';
import 'package:job_app/presentation/view_model/cubit/app_cubit.dart';
import 'package:job_app/presentation/views/App_layout.dart';
import 'package:job_app/presentation/views/auth/login_view.dart';

import 'core/classobserve.dart';
import 'core/helpers/local/cache_helper.dart';
import 'core/helpers/network/dio_helper.dart';
import 'presentation/view_model/cubit/settings_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  tokenHolder = CacheHelper.getData(key: tokenKey) ?? 'no token yet';
  changedToDark = CacheHelper.getData(key: themeKey);
  debugPrint(tokenHolder);
  debugPrint('----Theme----${changedToDark == true ? 'Dark' : 'Light'}');

  Widget? widget;

  if (tokenHolder == 'no token yet') {
    widget = LoginView();
  } else {
    widget = const AppLayout();
  }
  runApp(MyApp(
    widget: widget,
    // isDark: changedToDark!,
  ));
}


// ThemeManager _themeManager=ThemeManager();
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    this.widget,
    // required this.isDark,
  }) : super(key: key);
  final Widget? widget;
  // final bool isDark;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AppCubit>(
              create: (context) => AppCubit()
                ..getUserData()
                ..getJobs(),
            ),
            BlocProvider<SettingsCubit>(
              create: (context) => SettingsCubit(),
            ),
          ],
          child: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
            var cubit = BlocProvider.of<SettingsCubit>(context);
            return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                
                
                // CacheHelper.getData(key: themeKey)
                //     ? ThemeData.dark(useMaterial3: true)
                //     : ThemeData.light(useMaterial3: true),
                darkTheme: darkTheme,
                // themeMode: cubit.themeMode,
                themeMode: CacheHelper.getData(key: themeKey)==true ? ThemeMode.dark: ThemeMode.light,
                home: widget);
          }),
        );
      },
    );
  }
}
