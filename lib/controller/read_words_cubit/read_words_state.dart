part of 'read_words_cubit.dart';

@immutable
sealed class ReadWordsState {}

final class ReadWordsInitial extends ReadWordsState {}
final class ReadWordsLoading extends ReadWordsState {}
final class ReadWordsSuccess extends ReadWordsState {
  final List<WordModel> words;
  ReadWordsSuccess({required this.words});
}
final class ReadWordsFailure extends ReadWordsState {
  final String message;
  ReadWordsFailure({required this.message});
}
