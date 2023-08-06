import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/core/app_managers/ImagesManager.dart';
import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/app_managers/fonts.dart';
import 'package:job_app/presentation/view_model/cubit/app_cubit.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<AppCubit>(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              // backgroundColor: Colors.white,
              // elevation: 0.0,
              selectedLabelStyle: FontManager.greytext12,
              iconSize: 30,
              unselectedLabelStyle: FontManager.greytext12,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeNavBar(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.home_outlined,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.home_outlined,
                    color: ColorsManager.KprimaryColor,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(ImagesManager.ticket),
                  activeIcon: Image.asset(
                    ImagesManager.ticket,
                    color: ColorsManager.KprimaryColor,
                  ),
                  label: 'My Tip',
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    EvaIcons.bookmark,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    EvaIcons.bookmark,
                    color: ColorsManager.KprimaryColor,
                  ),
                  // activeIcon: Icon(Icons.favorite_border),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.person,
                    color: ColorsManager.KprimaryColor,
                  ),
                  // activeIcon: Icon(Icons.settings_accessibility),
                  label: 'Profile',
                ),
              ]),
        );
      },
    );
  }
}
