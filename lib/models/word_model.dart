class WordModel {
  final int idAtDataBase;
  final String text;
  final bool isArabic;
  final int colorCode;
  final List<String> arabicSimilarWords;
  final List<String> englishSimilarWords;
  final List<String> arabicExamples;
  final List<String> englishExamples;

  const WordModel({
    required this.idAtDataBase,
    required this.text,
    required this.isArabic,
    required this.colorCode,
    this.arabicSimilarWords = const [],
    this.englishSimilarWords = const [],
    this.arabicExamples = const [],
    this.englishExamples = const [],
  });
// decrementIdAtDataBase
  WordModel decrementIdAtDataBase() {
    return WordModel(
      idAtDataBase: idAtDataBase - 1,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }
// removeExampleWord
  WordModel removeExampleWord(int idAtExamples, bool isArabicExampleWord) {
    List<String> newExamples = _intializeExamples(isArabicExampleWord);
    newExamples.removeAt(idAtExamples);
    return _getWordModelAftercheckExample(newExamples, isArabicExampleWord);
  }
// addExampleWord
  WordModel addExampleWord(String exampleWord, bool isArabicExampleWord) {
    List<String> newExamples = _intializeExamples(isArabicExampleWord);
    newExamples.add(exampleWord);
    return _getWordModelAftercheckExample(newExamples, isArabicExampleWord);
  }
// intializeExamples helps to check if the word is arabic or english
// and return the list of examples
  List<String> _intializeExamples(bool isArabicExampleWord) {
    if (isArabicExampleWord) {
      return [...arabicExamples];
    } else {
      return [...englishExamples];
    }
  }
// getWordModelAftercheckExample helps to return the word model with updated examples
  WordModel _getWordModelAftercheckExample(
      List<String> newExamples, bool isArabicExampleWord) {
    return WordModel(
      idAtDataBase: idAtDataBase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: isArabicExampleWord ? newExamples : arabicExamples,
      englishExamples: isArabicExampleWord ? englishExamples : newExamples,
    );
  }
// removeSimilarWord
  WordModel deleteSimilarWord(int idAtSimilarWords, bool isArabicSimilarWord) {
    List<String> newSimilarWords = _intializeSimilarWords(isArabicSimilarWord);

    newSimilarWords.removeAt(idAtSimilarWords);
    return _getWordModelAftercheckSimilarWord(
        newSimilarWords, isArabicSimilarWord);
  }
// addSimilarWord
  WordModel addSimilarWord(String similarWord, bool isArabicSimilarWord) {
    List<String> newSimilarWords = _intializeSimilarWords(isArabicSimilarWord);

    newSimilarWords.add(similarWord);
    return _getWordModelAftercheckSimilarWord(
        newSimilarWords, isArabicSimilarWord);
  }
// intializeSimilarWords helps to check if the word is arabic or english 
// and return the list of similar words
  List<String> _intializeSimilarWords(bool isArabicSimilarWord) {
    if (isArabicSimilarWord) {
      return [...arabicSimilarWords];
    } else {
      return [...englishSimilarWords];
    }
  }
// getWordModelAftercheckSimilarWord helps to return the word model with updated similar words
  WordModel _getWordModelAftercheckSimilarWord(
      List<String> newSimilarWords, bool isArabicSimilarWord) {
    return WordModel(
      idAtDataBase: idAtDataBase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords:
          isArabicSimilarWord ? newSimilarWords : arabicSimilarWords,
      englishSimilarWords:
          !isArabicSimilarWord ? newSimilarWords : englishSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }
}
