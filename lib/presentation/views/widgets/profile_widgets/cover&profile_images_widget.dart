import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:job_app/core/constants.dart';
import 'package:job_app/core/helpers/local/cache_helper.dart';

import '../../../../core/app_managers/ImagesManager.dart';
import '../../../view_model/cubit/app_cubit.dart';

class Cover_ProfileImagesWidget extends StatelessWidget {
  const Cover_ProfileImagesWidget({
    Key? key,
    required this.cubit,
  }) : super(key: key);
  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
                width: double.infinity,
                height: 118.h,
                child: Image.asset(
                  ImagesManager.cover,
                  fit: BoxFit.cover,
                )),
            // Positioned(
            //     top: 100.h,
            //     left: 20.w,
            //     child: ElevatedButton(
            //         onPressed: () {
            //           cubit.changeUpdateMode();
            //           // cubit.update();
            //           // cubit.isInUpdateMode = true;
            //           // setState(() {
            //           //   widget.cubit.isInUpdateMode=true;
            //           // });

            //           debugPrint('In Update Mode');
            //         },
            //         child: const Text('Edit?'))),
            Positioned(
              left: 140.w,
              top: 70.h,
              child: InkWell(
                onTap: () {
                  CacheHelper.clearData(key: tokenKey);
                  print('Log out');
                },
                child: CircleAvatar(
                  radius: 55.r,
                  backgroundColor: Colors.white,
                  backgroundImage: const AssetImage(
                    ImagesManager.profile,
                  ),
                ),
              ),
            ),
            // Positioned(
            //   top: 200.h,
            //   left: 140.w,
            //   child:
            // )
          ],
        );
      },
    );
  }
}
