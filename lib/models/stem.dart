import 'package:ani_lo_medaber_ivrit/models/abstract_word.dart';

class Stem extends AbstractWord {
  final int id;
  
//todo add gizrah

  Stem({
    required this.id,
    required super.valueHebrew,
    required super.transliteration,
    required super.meanings,
  });
}
