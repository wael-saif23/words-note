import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_note/controller/read_words_cubit/read_words_cubit.dart';
import 'package:words_note/models/word_model.dart';
import 'package:words_note/views/widgets/exception_widget.dart';
import 'package:words_note/views/widgets/loading_widget.dart';
import 'package:words_note/views/widgets/word_item_widget.dart';

class WordsWidget extends StatelessWidget {
  const WordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadWordsCubit, ReadWordsState>(
      builder: (context, state) {
        if (state is ReadWordsSuccess) {
          if (state.words.isEmpty) {
            return _getWordsEmptyWidget();
          }
          return _getWordsWidget(state.words);
        } else if (state is ReadWordsFailure) {
          return _getReadingFailureWidget(message: state.message);
        } else {
          return _getReadingLoadingWidget();
        }
      },
    );
  }

  Widget _getWordsWidget(List<WordModel> words) {
    return GridView.builder(
        itemCount: words.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          return WordItemWidget(wordModel: words[index]);
        });
  }

  Widget _getWordsEmptyWidget() {
    return const ExceptionWidget(
      iconData: Icons.sentiment_dissatisfied,
      message: 'No words found',
    );
  }

  Widget _getReadingFailureWidget({required String message}) {
    return ExceptionWidget(
        iconData: Icons.sentiment_dissatisfied, message: message);
  }

  Widget _getReadingLoadingWidget() {
    return const LoadingWidget();
  }
}
