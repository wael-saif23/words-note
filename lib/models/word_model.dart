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

  WordModel addSimilarWord(String similarWord, bool isArabicSimilarWord) {
   List<String> newSimilarWords;
   if (isArabicSimilarWord) {
     newSimilarWords = [...arabicSimilarWords, similarWord];
   } else {
     newSimilarWords = [...englishSimilarWords, similarWord];
   }
    return WordModel(
      idAtDataBase: idAtDataBase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: isArabicSimilarWord ? newSimilarWords : arabicSimilarWords,
      englishSimilarWords: !isArabicSimilarWord ? newSimilarWords : englishSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }
  
}
