import 'package:flutter/material.dart';
import 'package:words_note/controller/read_words_cubit/read_words_cubit.dart';
import 'package:words_note/models/word_model.dart';
import 'package:words_note/views/screens/word_details_view.dart';
import 'package:words_note/views/styles/color_manager.dart';

class WordItemWidget extends StatelessWidget {
  const WordItemWidget({super.key, required this.wordModel});
  final WordModel wordModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(
              builder: (context) => WordDetailsView(wordModel: wordModel)))
          .then(
            (value) => ReadWordsCubit.get(context).getWords(),
          ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(wordModel.colorCode),
        ),
        child: Center(
            child: Text(
          wordModel.text,
          style: const TextStyle(
            color: ColorManager.emerald,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        )),
      ),
    );
  }
}
