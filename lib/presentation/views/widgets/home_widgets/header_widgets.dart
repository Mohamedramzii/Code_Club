import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/app_managers/fonts.dart';
import 'package:job_app/presentation/view_model/cubit/app_cubit.dart';
import 'package:job_app/presentation/view_model/cubit/settings_cubit.dart';
import 'package:job_app/presentation/views/auth/login_view.dart';

import '../../../../core/app_managers/ImagesManager.dart';
import '../../../../core/constants.dart';
import '../../../../core/helpers/local/cache_helper.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.cubit,
  }) : super(key: key);
  final AppCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                BlocProvider.of<AppCubit>(context).logout();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginView(),
                    ));
              },
              child: CircleAvatar(
                radius: 20.r,
                backgroundImage: const AssetImage(ImagesManager.profile),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello there',
                  style: FontManager.greytext12,
                ),
                Text(
                  cubit.userDataModel?.name ?? 'Our best guest',
                  style: FontManager.blacktext12
                      .copyWith(color: ColorsManager.KprimaryColor),
                ),
              ],
            )
          ],
        ),
        BlocBuilder<SettingsCubit, SettingsState>(builder: (context, _) {
          var cubit=BlocProvider.of<SettingsCubit>(context);
          return IconButton(onPressed: () {
            cubit.chanegTheme();
          }, icon: Icon(CacheHelper.getData(key: themeKey) ? Icons.light_mode: Icons.dark_mode));
        })
        // Container(
        //   width: 35.w,
        //   height: 35.h,
        //   decoration: BoxDecoration(
        //       color: Colors.grey.shade200, shape: BoxShape.circle),
        //   child: Icon(
        //     Icons.mail_rounded,
        //     color: ColorsManager.KprimaryColor,
        //   ),
        // )
      ],
    );
  }
}
