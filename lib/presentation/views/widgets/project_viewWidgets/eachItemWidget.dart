import 'package:flutter/material.dart';

import '../../../../core/app_managers/fonts.dart';
import 'customTextFieldWidget.dart';

class EachItemWidget extends StatelessWidget {
  EachItemWidget({
    Key? key,
    required this.aboveFieldText,
    required this.belowFieldText,
    required this.maxlines,
    required this.isDescription,
    required this.controller,
  }) : super(key: key);

  final String aboveFieldText;
  final String belowFieldText;
  final int maxlines;
  final bool isDescription;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          aboveFieldText,
          style: FontManager.blacktext12,
        ),
        CustomTextField(
          isDescription: isDescription,
          controller: controller,
          maxlines: maxlines,
        ),
        Text(
          belowFieldText,
          style: FontManager.text10.copyWith(color: Colors.grey),
        )
      ],
    );
  }
}
