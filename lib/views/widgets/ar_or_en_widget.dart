import 'package:flutter/material.dart';
import 'package:words_note/controller/write_words_cubit/write_words_cubit.dart';
import 'package:words_note/views/styles/color_manager.dart';

class ArOrEnWidget extends StatelessWidget {
  const ArOrEnWidget(
      {super.key, required this.isSelected, required this.colorCode});
  final bool isSelected;
  final int colorCode;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        langaugeSelected(context, true),
        const SizedBox(width: 8),
        langaugeSelected(context, false),
      ],
    );
  }

  InkWell langaugeSelected(BuildContext context, bool isArabicSelected) {
    return InkWell(
      onTap: () {
        WriteWordsCubit.get(context).updateIsArabic(isArabicSelected);
      },
      splashColor: ColorManager.transparent,
      child: AnimatedContainer(
        decoration: BoxDecoration(
            border: isSelected == isArabicSelected
                ?  Border(
                    bottom: BorderSide(
                      color: !(isSelected == isArabicSelected)? Color(colorCode):ColorManager.emerald,
                      width: 3,
                    ),
                    right: BorderSide(
                      color: !(isSelected == isArabicSelected)? Color(colorCode):ColorManager.emerald,
                      width: 3,
                    ),
                  )
                : null,
            color: 
            isSelected == isArabicSelected? Color(colorCode):ColorManager.emerald,
            shape: BoxShape.circle),
        duration: const Duration(milliseconds: 500),
        height: isSelected == isArabicSelected ? 50 : 44,
        width: isSelected == isArabicSelected ? 50 : 44,
        child: Center(
          child: Text(
            isArabicSelected ? "ar" : 'en',
            style: TextStyle(
                fontSize: isSelected == isArabicSelected ? 20 : 16,
                fontWeight: FontWeight.bold,
                color:!(isSelected == isArabicSelected)? Color(colorCode):ColorManager.emerald),
          ),
        ),
      ),
    );
  }
}
