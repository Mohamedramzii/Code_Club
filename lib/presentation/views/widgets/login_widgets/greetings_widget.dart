import 'package:flutter/material.dart';

import '../../../../core/app_managers/ImagesManager.dart';
import '../../../../core/app_managers/fonts.dart';
import '../../../../core/app_managers/strings.dart';
import '../../../../generated/l10n.dart';

class GreetingsWidget extends StatelessWidget {
  const GreetingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            ImagesManager.applogo,
            // height: 200.h,
            // width: 200.w,
          ),
        ),

        //greetings
        Text(
          S.of(context).Welcome_Back,
          style: FontManager.text25,
        ),
        Text(
          S.of(context).Welcome_Back_please_enter_your_details,
          style: FontManager.greytext15,
        )
      ],
    );
  }
}
