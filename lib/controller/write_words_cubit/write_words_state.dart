part of 'write_words_cubit.dart';

@immutable
sealed class WriteWordsState {}

final class WriteWordsInitial extends WriteWordsState {}

final class WriteWordsLoading extends WriteWordsState {}

final class WriteWordsSuccess extends WriteWordsState {}

final class WriteWordsFailure extends WriteWordsState {
  final String message;

  WriteWordsFailure({required this.message});
}
