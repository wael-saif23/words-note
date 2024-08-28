import 'package:flutter/material.dart';
import 'package:words_note/views/styles/color_manager.dart';

class IconAddWordWidget extends StatelessWidget {
  const IconAddWordWidget({super.key, required this.onPressed, required this.color});
  final VoidCallback onPressed;
  final Color color ;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:color, 
        ),
        onPressed: onPressed,
        child: const Icon(
          Icons.add,
          size: 30,
          color: ColorManager.midnightGreen,
        ));
  }
}
