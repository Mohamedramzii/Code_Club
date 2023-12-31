import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:job_app/core/app_managers/colors.dart';
import 'package:job_app/core/app_managers/fonts.dart';
import 'package:job_app/core/constants.dart';

import '../../../../core/common_widgets/dialog_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../view_model/cubit/app_cubit.dart';

class InfoBlockWidget extends StatelessWidget {
  const InfoBlockWidget({
    Key? key,
    required this.website,
    required this.phone,
    required this.email,
    required this.joinedat,
    required this.cubit,
  }) : super(key: key);
  final String website;
  final dynamic phone;
  final String email;
  final String joinedat;
  final AppCubit cubit;

  static TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            S.of(context).information,
            style: FontManager.blacktext15
                .copyWith(color: ColorsManager.KprimaryColor),
          ),
          SizedBox(
            height: 17.h,
          ),
          _buildRow(EvaIcons.globe, S.of(context).Website, website,
              S.of(context).Website, context, false),
          SizedBox(
            height: 18.h,
          ),
          _buildRow(EvaIcons.emailOutline, S.of(context).Email, email,
              S.of(context).Email, context, true),
          SizedBox(
            height: 18.h,
          ),
          _buildRow(EvaIcons.phoneOutline, S.of(context).Phone, phone,
              S.of(context).Phone, context, false),
          SizedBox(
            height: 18.h,
          ),
          _buildRoforJoined(
            EvaIcons.calendarOutline,
            S.of(context).joined,
            joinedat,
          ),
        ],
      ),
    );
  }

  Row _buildRow(IconData icon, String text, dynamic info, String whatToUpdate,
      context, bool isEmail) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            //icon
            Icon(
              icon,
              size: 20,
            ),
            SizedBox(
              width: 0.w,
            )
            //text
            ,
            Row(
              children: [
                Text(
                  text,
                  style: FontManager.greytext12,
                ),
                GestureDetector(
                    onTap: () {
                      CustomDialog.ShowDialog(
                          context: context,
                          controller: controller,
                          // data: data,
                          whatToUpdate: whatToUpdate,
                          onpressed: () {
                            if (isEmail) {
                              if (controller.text.isNotEmpty &&
                                  emailRegex.hasMatch(controller.text)) {
                                cubit.updateUserData(
                                    context: context,
                                    dataToChange: whatToUpdate,
                                    updateData: controller.text.isEmpty
                                        ? 'Empty Data'
                                        : controller.text);
                                controller.clear();
                                Navigator.pop(context);
                              } else {
                                return;
                              }
                            } else {
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
                            }
                          });
                    },
                    child: const Icon(
                      EvaIcons.edit2,
                      size: 20,
                    ))
              ],
            )
          ],
        ),
        Text(
          info.toString(),
          style: Theme.of(context).textTheme.titleSmall!,
        )
      ],
    );
  }

  Row _buildRoforJoined(
    IconData icon,
    String text,
    String info,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            //icon
            Icon(
              icon,
              size: 20,
            ),
            // SizedBox(
            //   width: 15.w,
            // )
            //text
            
            Text(
              text,
              style: FontManager.greytext12,
            ),
          ],
        ),
        Text(
          info,
          style: FontManager.blacktext12,
        )
      ],
    );
  }

//   Row _buildRowWidgDialog(
//       {required String text,
//       required TextStyle textstyle,
//       required String whatToUpdate,
//       required context}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           text,
//           style: textstyle,
//         ),
//         GestureDetector(
//             onTap: () {
//               CustomDialog.ShowDialog(
//                   context: context,
//                   controller: controller,
//                   // data: data,
//                   whatToUpdate: whatToUpdate,
//                   onpressed: () {
//                     if (controller.text.isNotEmpty) {
//                       cubit.updateUserData(
//                           context: context,
//                           dataToChange: whatToUpdate,
//                           updateData: controller.text.isEmpty
//                               ? 'Empty Data'
//                               : controller.text);
//                       Navigator.pop(context);
//                     } else {
//                       return;
//                     }
//                   });
//             },
//             child: const Icon(
//               EvaIcons.edit2,
//               size: 20,
//             ))
//       ],
//     );
//   }
// }
}
