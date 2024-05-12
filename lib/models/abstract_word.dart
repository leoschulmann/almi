import 'package:ani_lo_medaber_ivrit/enums/foreign_lang.dart';
import 'package:ani_lo_medaber_ivrit/enums/hebrew_lang.dart';

abstract class AbstractWord {
  AbstractWord({
    required this.valueHebrew,
    required this.transliteration,
    required this.meanings,
  });

  final Map<HebrewLang, String> valueHebrew;
  final Map<ForeignLang, String> transliteration;
  final Map<ForeignLang, List<String>> meanings;
}
