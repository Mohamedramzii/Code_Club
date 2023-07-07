import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/core/app_managers/fonts.dart';

import 'package:job_app/core/constants.dart';
import 'package:job_app/presentation/view_model/cubit/app_cubit.dart';
import 'package:job_app/presentation/views/App_layout.dart';
import 'package:job_app/presentation/views/ProfileView.dart';
import 'package:job_app/presentation/views/auth/login_view.dart';

import 'core/classobserve.dart';
import 'core/helpers/local/cache_helper.dart';
import 'core/helpers/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  tokenHolder = CacheHelper.getData(key: tokenKey) ?? 'no token yet';
  debugPrint(tokenHolder);

  Widget? widget;

  if (tokenHolder=='no token yet') {
    widget = LoginView();
  } else {
    widget = AppLayout();
  }
  runApp(MyApp(
    widget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.widget,
  }) : super(key: key);
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      // useInheritedMediaQuery: truer,
      builder: (context, child) {
        return BlocProvider<AppCubit>(
          create: (context) => AppCubit(),
          child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: widget),
        );
      },
    );
  }
}
