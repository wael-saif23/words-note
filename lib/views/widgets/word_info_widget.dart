import 'package:flutter/material.dart';
import 'package:words_note/views/styles/color_manager.dart';

class WordInfoWidget extends StatelessWidget {
  const WordInfoWidget(
      {super.key,
      this.onPressed,
      required this.word,
      required this.colorCode,
      required this.isArabic});
  final String word;
  final int colorCode;
  final bool isArabic;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: _getBoxDecoration(),
        child: Row(
          children: [
            _getIsArabicInCircle(),
            _getWord(),
            if (onPressed != null) _getIconButton()
          ],
        ));
  }

  IconButton _getIconButton() {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.delete,
        color: ColorManager.sunglow,
      ),
    );
  }

  Text _getWord() {
    return Text(
      word,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: ColorManager.midnightGreen,
      ),
    );
  }

  CircleAvatar _getIsArabicInCircle() {
    return CircleAvatar(
      backgroundColor: ColorManager.midnightGreen,
      radius: 16,
      child: Text(isArabic ? 'ar' : 'en',
          style: TextStyle(
            fontSize: 24,
            color: Color(colorCode),
            fontWeight: FontWeight.bold,
          )),
    );
  }

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(
      color: Color(colorCode),
      border: Border.all(color: ColorManager.sunglow),
      borderRadius: const BorderRadius.all(Radius.circular(24)),
    );
  }
}
