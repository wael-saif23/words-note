import 'package:flutter/material.dart';
import 'package:words_note/views/styles/color_manager.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({super.key, required this.colorCode, required this.onTap});
  final int colorCode;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: onTap,
        child: Container(
            width: 80,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: ColorManager.emerald,
            ),
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                'Done',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(colorCode),
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }
}
