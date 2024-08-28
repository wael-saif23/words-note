import 'package:flutter/material.dart';
import 'package:words_note/views/styles/color_manager.dart';

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget(
      {super.key, required this.iconData, required this.message});
  final IconData iconData;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: ColorManager.sunglow.withOpacity(.3),
          size: 50,
        ),
        const SizedBox(height: 12),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorManager.sunglow.withOpacity(.3),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
