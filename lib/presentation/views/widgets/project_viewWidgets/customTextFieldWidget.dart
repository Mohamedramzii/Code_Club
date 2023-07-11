import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.maxlines,
    required this.isDescription,
    required this.controller,
  }) : super(key: key);
  final int maxlines;
  final bool isDescription;
   TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isDescription ? 150.h : 32.h ,
      child: TextField(
        maxLines: maxlines,
    
        // minLines: 8,
        controller: controller,
        onSubmitted: (value) => controller.text = value,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.r))),
      ),
    );
  }
}
