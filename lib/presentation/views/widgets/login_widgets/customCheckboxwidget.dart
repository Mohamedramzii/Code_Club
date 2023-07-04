import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final double size;
  final bool value;
  final Function(bool?) onChanged;

  const CustomCheckbox({
    Key? key,
    required this.size,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
