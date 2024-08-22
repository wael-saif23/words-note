import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:words_note/hive_constants.dart';
import 'package:words_note/models/word_model.dart';

part 'read_words_state.dart';

class ReadWordsCubit extends Cubit<ReadWordsState> {
  ReadWordsCubit() : super(ReadWordsInitial());
  static get(context) => BlocProvider.of<ReadWordsCubit>(context);

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

  List<WordModel> getWords() {
    return _wordsBox.values.toList().cast<WordModel>();
  }
}

enum LanguageFilter { arabic, english, both }

enum SortingTypeFilter { ascending, descending }

enum SortedByFilter { time, length }
