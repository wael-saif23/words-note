import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_note/controller/read_words_cubit/read_words_cubit.dart';
import 'package:words_note/controller/write_words_cubit/write_words_cubit.dart';
import 'package:words_note/models/word_model.dart';
import 'package:words_note/views/widgets/exception_widget.dart';
import 'package:words_note/views/widgets/icon_add_word_widget.dart';
import 'package:words_note/views/widgets/loading_widget.dart';
import 'package:words_note/views/widgets/update_word_dialog.dart';
import 'package:words_note/views/widgets/word_info_widget.dart';

class WordDetailsView extends StatefulWidget {
  const WordDetailsView({super.key, required this.wordModel});
  final WordModel wordModel;

  @override
  State<WordDetailsView> createState() => _WordDetailsViewState();
}

class _WordDetailsViewState extends State<WordDetailsView> {
  late WordModel _wordModel;
  @override
  void initState() {
    super.initState();
    _wordModel = widget.wordModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: BlocBuilder<ReadWordsCubit, ReadWordsState>(
            builder: (context, state) {
              if (state is ReadWordsSuccess) {
                int index = state.words.indexWhere((element) =>
                    element.idAtDataBase == _wordModel.idAtDataBase);
                if (index == -1) {
                  return const LoadingWidget();
                }
                _wordModel = state.words[index];
                return _getSuccessState(context);
              } else if (state is ReadWordsFailure) {
                return ExceptionWidget(
                    iconData: Icons.error, message: state.message);
              } else {
                return const LoadingWidget();
              }
            },
          )),
    );
  }

  ListView _getSuccessState(BuildContext context) {
    return ListView(children: [
      _getTextLable(text: 'The Word'),
      const SizedBox(height: 8),
      WordInfoWidget(
        colorCode: _wordModel.colorCode,
        isArabic: _wordModel.isArabic,
        word: _wordModel.text,
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
                colorCode: _wordModel.colorCode,
                idInDatabase: _wordModel.idAtDataBase,
              ),
            ),
            color: Color(_wordModel.colorCode),
          ),
        ],
      ),
      const SizedBox(height: 8),
      for (int i = 0; i < _wordModel.arabicSimilarWords.length; i++)
        WordInfoWidget(
          colorCode: _wordModel.colorCode,
          isArabic: true,
          word: _wordModel.arabicSimilarWords[i],
          onPressed: () => _deletArabicSimilarWord(i),
        ),
      for (int i = 0; i < _wordModel.englishSimilarWords.length; i++)
        WordInfoWidget(
          colorCode: _wordModel.colorCode,
          isArabic: false,
          word: _wordModel.englishSimilarWords[i],
          onPressed: () => _deletEnglishSimilarWord(i),
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
                colorCode: _wordModel.colorCode,
                idInDatabase: _wordModel.idAtDataBase,
              ),
            ),
            color: Color(_wordModel.colorCode),
          )
        ],
      ),
      const SizedBox(height: 8),
      for (int i = 0; i < _wordModel.arabicExamples.length; i++)
        WordInfoWidget(
          colorCode: _wordModel.colorCode,
          isArabic: true,
          word: _wordModel.arabicExamples[i],
          onPressed: () => _deletArabicExample(i),
        ),
      for (int i = 0; i < _wordModel.englishExamples.length; i++)
        WordInfoWidget(
          colorCode: _wordModel.colorCode,
          isArabic: false,
          word: _wordModel.englishExamples[i],
          onPressed: () => _deletEnglishExample(i),
        ),
    ]);
  }

  Text _getTextLable({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(_wordModel.colorCode),
      ),
    );
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(size: 30, color: Color(_wordModel.colorCode)),
      title: Text(
        'Word Details',
        style: TextStyle(
          color: Color(_wordModel.colorCode),
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
    WriteWordsCubit.get(context).deleteWord(_wordModel.idAtDataBase);
    ReadWordsCubit.get(context).getWords();
    Navigator.pop(context);
  }

  _deletArabicSimilarWord(int index) {
    WriteWordsCubit.get(context).deleteSimilarWord(
      _wordModel.idAtDataBase,
      index,
      true,
    );
    ReadWordsCubit.get(context).getWords();
  }

  _deletEnglishSimilarWord(int index) {
    WriteWordsCubit.get(context).deleteSimilarWord(
      _wordModel.idAtDataBase,
      index,
      false,
    );
    ReadWordsCubit.get(context).getWords();
  }

  _deletArabicExample(int index) {
    WriteWordsCubit.get(context).deleteExample(
      _wordModel.idAtDataBase,
      index,
      true,
    );
    ReadWordsCubit.get(context).getWords();
  }

  _deletEnglishExample(int index) {
    WriteWordsCubit.get(context).deleteExample(
      _wordModel.idAtDataBase,
      index,
      false,
    );
    ReadWordsCubit.get(context).getWords();
  }
}
