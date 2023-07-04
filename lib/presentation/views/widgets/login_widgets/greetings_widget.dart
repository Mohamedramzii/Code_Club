import 'package:flutter/material.dart';

import '../../../../core/app_managers/assets.dart';
import '../../../../core/app_managers/fonts.dart';
import '../../../../core/app_managers/strings.dart';

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
          ENstrings.welcome,
          style: FontManager.text25,
        ),
        Text(
          ENstrings.welcome2,
          style: FontManager.greytext15,
        )
      ],
    );
  }
}
