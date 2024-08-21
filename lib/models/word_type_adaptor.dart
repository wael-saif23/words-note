import 'package:hive_flutter/adapters.dart';
import 'package:words_note/models/word_model.dart';

class WordTypeAdaptor extends TypeAdapter<WordModel> {
  @override
  WordModel read(BinaryReader reader) {
    return WordModel(
      idAtDataBase: reader.readInt(),
      text: reader.readString(),
      isArabic: reader.readBool(),
      colorCode: reader.readInt(),
      arabicExamples: reader.readStringList(),
      englishExamples: reader.readStringList(),
      arabicSimilarWords: reader.readStringList(),
      englishSimilarWords: reader.readStringList(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, WordModel obj) {
    writer
      ..writeInt(obj.idAtDataBase)
      ..writeString(obj.text)
      ..writeBool(obj.isArabic)
      ..writeInt(obj.colorCode)
      ..writeStringList(obj.arabicExamples)
      ..writeStringList(obj.englishExamples)
      ..writeStringList(obj.arabicSimilarWords)
      ..writeStringList(obj.englishSimilarWords);
  }
}
