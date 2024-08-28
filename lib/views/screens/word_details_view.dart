import 'package:flutter/material.dart';
import 'package:words_note/controller/write_words_cubit/write_words_cubit.dart';
import 'package:words_note/models/word_model.dart';

class WordDetailsView extends StatelessWidget {
  const WordDetailsView({super.key, required this.wordModel});
  final WordModel wordModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(wordModel.colorCode),
        title: Text(
          'Word Details',
          style: TextStyle(
            color: Color(wordModel.colorCode),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _deleteWord(context),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
 void _deleteWord(BuildContext context) {
    WriteWordsCubit.get(context).deleteWord(wordModel.idAtDataBase);
    Navigator.pop(context);
  }
}
