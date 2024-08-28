import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_note/controller/read_words_cubit/read_words_cubit.dart';

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
         return _getWordsWidget();
        }
        else if (state is ReadWordsFailure) {
         return _getReadingFailureWidget();
        }else {
         return _getReadingLoadingWidget();
        }
      },
    );
  }

  Widget _getWordsWidget() {
    return SizedBox();
  }

 
  Widget _getWordsEmptyWidget() {
    return SizedBox();
  }

  Widget _getReadingFailureWidget() {
    return SizedBox();
  }

  Widget _getReadingLoadingWidget() {
    return SizedBox();
  }
}
