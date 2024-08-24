import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:words_note/hive_constants.dart';
import 'package:words_note/models/word_model.dart';

part 'write_words_state.dart';

class WriteWordsCubit extends Cubit<WriteWordsState> {
  WriteWordsCubit() : super(WriteWordsInitial());
  static get(context) => BlocProvider.of<WriteWordsCubit>(context);

  final Box _wordsBox = Hive.box(HiveConstants.wordsBox);
  String text = '';
  bool isArabic = true;
  int colorCode = Colors.blue.value;

  void updateText(String text) {
    this.text = text;
  }

  void updateIsArabic(bool isArabic) {
    this.isArabic = isArabic;
  }

  void updateColorCode(int colorCode) {
    this.colorCode = colorCode;
  }

  void addWord() {
    _tryAndCatchBlock(
        methodToExecute: () {
          List<WordModel> words = _getWordsFromDAtabase();
          words.add(WordModel(
              idAtDataBase: words.length,
              text: text,
              isArabic: isArabic,
              colorCode: colorCode));
          _wordsBox.put(HiveConstants.wordsBox, words);
        },
        message: "we have problem in adding word , please try again");
  }

  void deleteWord(int idAtDatabase) {
    _tryAndCatchBlock(
        methodToExecute: () {
          List<WordModel> words = _getWordsFromDAtabase();
          words.removeAt(idAtDatabase);
          for (var i = idAtDatabase; i < words.length; i++) {
            words[i] = words[i].decrementIdAtDataBase();
            _wordsBox.put(HiveConstants.wordsBox, words);
          }
        },
        message: "we have problem in deleting word , please try again");
  }

  void _tryAndCatchBlock(
      {required VoidCallback methodToExecute, required String message}) {
    emit(WriteWordsLoading());
    try {
      methodToExecute.call();
      emit(WriteWordsSuccess());
    } catch (e) {
      emit(WriteWordsFailure(message: message));
    }
  }

  List<WordModel> _getWordsFromDAtabase() =>
      List.from(_wordsBox.get(HiveConstants.wordsBox, defaultValue: []))
          .cast<WordModel>();
}


