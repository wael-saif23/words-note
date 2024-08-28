import 'package:flutter/material.dart';
import 'package:words_note/controller/write_words_cubit/write_words_cubit.dart';
import 'package:words_note/models/word_model.dart';
import 'package:words_note/views/widgets/icon_add_word_widget.dart';
import 'package:words_note/views/widgets/update_word_dialog.dart';
import 'package:words_note/views/widgets/word_info_widget.dart';

class WordDetailsView extends StatelessWidget {
  const WordDetailsView({super.key, required this.wordModel});
  final WordModel wordModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(children: [
          _getTextLable(text: 'The Word'),
          const SizedBox(height: 8),
          WordInfoWidget(
            colorCode: wordModel.colorCode,
            isArabic: wordModel.isArabic,
            word: wordModel.text,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: _getTextLable(text: 'Similar Words')),
              IconAddWordWidget(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => UpdateWordDialog(
                    isExampleWord: false,
                    colorCode: wordModel.colorCode,
                  ),
                ),
                color: Color(wordModel.colorCode),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: _getTextLable(text: 'Expamples')),
              IconAddWordWidget(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => UpdateWordDialog(
                    isExampleWord: true,
                    colorCode: wordModel.colorCode,
                  ),
                ),
                color: Color(wordModel.colorCode),
              )
            ],
          ),
        ]),
      ),
    );
  }

  Text _getTextLable({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(wordModel.colorCode),
      ),
    );
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(size: 30, color: Color(wordModel.colorCode)),
      title: Text(
        'Word Details',
        style: TextStyle(
          color: Color(wordModel.colorCode),
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => _deleteWord(context),
          icon: const Icon(
            Icons.delete,
          ),
        ),
      ],
    );
  }

  void _deleteWord(BuildContext context) {
    WriteWordsCubit.get(context).deleteWord(wordModel.idAtDataBase);
    Navigator.pop(context);
  }
}
