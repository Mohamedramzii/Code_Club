import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:job_app/core/app_managers/fonts.dart';
import 'package:job_app/core/common_widgets/dialog_widget.dart';

import '../../../view_model/cubit/app_cubit.dart';

class UserDetailsWidget extends StatelessWidget {
  UserDetailsWidget({
    Key? key,
    required this.name,
    required this.joinedat,
    required this.slug,
    required this.bio,
    required this.cubit,
  }) : super(key: key);
  final String name;
  final String joinedat;
  final String slug;
  final String bio;
  final AppCubit cubit;
  // final bool isInUpdateMode;

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildRow(
            isBio: false,
            context: context,
            text: slug,
            textstyle: FontManager.greytext12,
            whatToUpdate: 'slug'),
        _buildRow(
            context: context,
            text: name,
            textstyle: Theme.of(context).textTheme.titleSmall!,
            whatToUpdate: 'username',
            isBio: false),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bandung', style: FontManager.purpletext10),
            SizedBox(
              width: 10.w,
            ),
            Container(
              width: 2.w,
              height: 10.h,
              color: Colors.black,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text('Joined at $joinedat', style: FontManager.purpletext10),
          ],
        ),
        SizedBox(
          height: 21.h,
        ),
        _buildRow(
            text: bio,
            textstyle: FontManager.greytext12,
            whatToUpdate: 'bio',
            context: context,
            isBio: true)
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 32.w),
        //   child: Text(
        //     bio,
        //     style: FontManager.greytext12,
        //     textAlign: TextAlign.center,
        //   ),
        // )
      ],
    );
  }

  Row _buildRow(
      {required String text,
      required bool isBio,
      required TextStyle textstyle,
      required String whatToUpdate,
      required context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isBio == true
            ? ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: 300.w,
                    maxWidth: 350.w,
                    minHeight: 30.h,
                    maxHeight: 130.h),
                child: Text(
                  text,
                  style: textstyle,
                  textAlign: TextAlign.center,
                ))
            : Text(
                text,
                style: textstyle,
              ),
        GestureDetector(
            onTap: () {
              CustomDialog.ShowDialog(
                  context: context,
                  controller: controller,
                  // data: data,
                  whatToUpdate: whatToUpdate,
                  onpressed: () {
                    if (controller.text.isNotEmpty) {
                      cubit.updateUserData(
                          context: context,
                          dataToChange: whatToUpdate,
                          updateData: controller.text.isEmpty
                              ? 'Empty Data'
                              : controller.text);
                      Navigator.pop(context);
                    } else {
                      return;
                    }
                  });
            },
            child: const Icon(
              EvaIcons.edit2,
              size: 20,
            ))
      ],
    );
  }
}
