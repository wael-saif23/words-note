import 'package:flutter/widgets.dart';
import 'package:words_note/models/word_model.dart';
import 'package:words_note/views/styles/color_manager.dart';

class WordItemWidget extends StatelessWidget {
  const WordItemWidget({super.key, required this.word});
  final WordModel word;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(word.colorCode),
      ),
      child: Center(
          child: Text(
        word.text,
        style: const TextStyle(
          color: ColorManager.emerald,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      )),
    );
  }
}
