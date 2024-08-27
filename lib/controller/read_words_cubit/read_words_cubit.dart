import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:words_note/hive_constants.dart';
import 'package:words_note/models/word_model.dart';

part 'read_words_state.dart';

class ReadWordsCubit extends Cubit<ReadWordsState> {
  ReadWordsCubit() : super(ReadWordsInitial());
  static ReadWordsCubit get(context) =>
      BlocProvider.of<ReadWordsCubit>(context);

  final Box _wordsBox = Hive.box(HiveConstants.wordsBox);
  LanguageFilter languageFilter = LanguageFilter.both;
  SortingTypeFilter sortingTypeFilter = SortingTypeFilter.descending;
  SortedByFilter sortedByFilter = SortedByFilter.time;

  void updateLanguageFilter(LanguageFilter languageFilter) {
    this.languageFilter = languageFilter;
  }

  void updateSortingTypeFilter(SortingTypeFilter sortingTypeFilter) {
    this.sortingTypeFilter = sortingTypeFilter;
  }

  void updateSortedByFilter(SortedByFilter sortedByFilter) {
    this.sortedByFilter = sortedByFilter;
  }

  getWords() {
    emit(ReadWordsLoading());
    try {
      List<WordModel> wordsToReturn =
          List.from(_wordsBox.get(HiveConstants.wordsList, defaultValue: []))
              .cast<WordModel>();
      _removeUnknownWords(wordsToReturn);
      _applySorting(wordsToReturn);
      emit(ReadWordsSuccess(words: wordsToReturn));
    } catch (e) {
      emit(ReadWordsFailure(
          message: "we have and error to read words , please try again"));
    }
  }

  _removeUnknownWords(List<WordModel> wordsToReturn) {
    if (languageFilter == LanguageFilter.both) {
      return;
    }
    for (var i = 0; i < wordsToReturn.length; i++) {
      if (languageFilter == LanguageFilter.arabic &&
              wordsToReturn[i].isArabic == false ||
          languageFilter == LanguageFilter.english &&
              wordsToReturn[i].isArabic == true) {
        wordsToReturn.removeAt(i);
        i--;
      }
    }
  }

  _applySorting(List<WordModel> wordsToReturn) {
    if (sortedByFilter == SortedByFilter.time) {
      if (sortingTypeFilter == SortingTypeFilter.ascending) {
        return;
      } else {
        _reverseList(wordsToReturn);
      }
    } else {
      if (sortingTypeFilter == SortingTypeFilter.ascending) {
        wordsToReturn.sort((a, b) => a.text.length.compareTo(b.text.length));
      } else {
        wordsToReturn.sort((a, b) => b.text.length.compareTo(a.text.length));
      }
    }
  }

  _reverseList(List<WordModel> wordsToReturn) {
    for (var i = 0; i < wordsToReturn.length / 2; i++) {
      WordModel temp = wordsToReturn[i];
      wordsToReturn[i] = wordsToReturn[wordsToReturn.length - 1 - i];
      wordsToReturn[wordsToReturn.length - 1 - i] = temp;
    }
  }
}

enum LanguageFilter { arabic, english, both }

enum SortingTypeFilter { ascending, descending }

enum SortedByFilter { time, length }
