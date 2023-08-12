// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/common_widgets/customButtonWidget.dart';
import 'package:job_app/core/constants.dart';
import 'package:job_app/core/helpers/local/cache_helper.dart';
import 'package:job_app/presentation/view_model/cubit/settings_cubit.dart';
import 'package:job_app/presentation/views/auth/login_view.dart';
import 'package:job_app/presentation/views/widgets/profile_widgets/divider.dart';
import 'package:job_app/presentation/views/widgets/profile_widgets/infoBlock_widget.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../generated/l10n.dart';
import '../view_model/cubit/app_cubit.dart';
import 'widgets/profile_widgets/cover&profile_images_widget.dart';
import 'widgets/profile_widgets/skillsBlock_widget.dart';
import 'widgets/profile_widgets/userdetailswidget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    tokenHolder = CacheHelper.getData(key: tokenKey);
    return Scaffold(
      body: BlocProvider(
        create: (context) => AppCubit()..getUserData(),
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) async {
            AppCubit cubit = BlocProvider.of<AppCubit>(context);
            if (state is UpdateUserDataSuccessState) {
              await cubit.getUserData();
            }
            if (state is LogoutSuccessState) {
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                  context,
                  PageAnimationTransition(
                      page: LoginView(),
                      pageAnimationType: BottomToTopTransition()));
            }
          },
          builder: (context, state) {
            if (state is GetUserDataSuccessState) {
              AppCubit cubit = BlocProvider.of<AppCubit>(context);
              SettingsCubit cubit2 = BlocProvider.of<SettingsCubit>(context);
//
              return SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Cover_ProfileImagesWidget(cubit: cubit),
                      SizedBox(
                        height: 65.h,
                      ),
                      UserDetailsWidget(
                        name: cubit.userDataModel!.name!,
                        slug: cubit.userDataModel!.slug == null
                            ? '@yourslug'
                            : '@${cubit.userDataModel!.slug}',
                        joinedat: cubit.userDataModel!.joinedAt!,
                        cubit: cubit,
                        bio: cubit.userDataModel!.bio == null
                            ? '@yourBio'
                            : '${cubit.userDataModel!.bio}',
                        // isInUpdateMode: cubit.isInUpdateMode!,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const CustomDivider(),
                      SizedBox(
                        height: 12.h,
                      ),
                      InfoBlockWidget(
                        cubit: cubit,
                        email: cubit.userDataModel!.email!,
                        joinedat: cubit.userDataModel!.joinedAt!,
                        phone: cubit.userDataModel?.phoneNumber ??
                            '+20 0113456879',
                        website:
                            cubit.userDataModel?.website ?? 'www.codeclub.com',
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      const CustomDivider(),
                      SizedBox(
                        height: 24.h,
                      ),
                      SkillsBlockWidget(
                        cubit: cubit,
                      ),
                      // const CustomDivider(),
                      SizedBox(
                        height: 20.h,
                      ),
                      BlocBuilder<SettingsCubit, SettingsState>(
                        builder: (context, state) {
                          return ExpansionTile(
                            
                            title: Text(
                              S.of(context).Settings,
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Intl.getCurrentLocale() == 'en'
                                        ? 7.w
                                        : 10.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      S.of(context).Theme,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.w),
                                      child: Row(
                                        children: [
                                          Text(S.of(context).Light),
                                          Switch(
                                            value: cubit2.isDark,
                                            onChanged: (value) {
                                              cubit2.switchThemeToggle(value);
                                            },
                                          ),
                                          Text(S.of(context).Dark),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Intl.getCurrentLocale() == 'en'
                                        ? 7.w
                                        : 10.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      S.of(context).Language,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: Intl.getCurrentLocale() == 'en'
                                            ? 11.w
                                            : 0.w,
                                        left: Intl.getCurrentLocale() == 'ar'
                                            ? 0.w
                                            : 11.w,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(S.of(context).En),
                                          Switch(
                                            value: cubit2.isEn,
                                            onChanged: (value) {
                                              cubit2
                                                  .switchLanguageToggle(value);
                                            },
                                          ),
                                          Text(S.of(context).Ar),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 70.h,
                                  child: CustomButton(
                                    text: 'Logout',
                                    color: ColorsManager.KprimaryColor,
                                    onpressed: () {
                                      cubit.logout();
                                    },
                                    textcolor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            } else if (state is GetUserDataFailureState) {
              return Center(
                child: Text(state.errMessage),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
