import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_app/core/constants.dart';
import 'package:job_app/presentation/view_model/cubit/app_cubit.dart';

import 'package:job_app/presentation/views/auth/login_view.dart';
import 'package:job_app/presentation/views/auth/register_view.dart';

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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              home: LoginView()),
        );
      },
    );
  }
}
