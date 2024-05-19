import 'package:ani_lo_medaber_ivrit/models/abstract_word.dart';
import 'package:ani_lo_medaber_ivrit/models/binyan.dart';

class Stem extends AbstractWord {
  final int id;
  final Binyan binyan;

  Stem({
    required this.id,
    required super.valueHebrew,
    required super.transliteration,
    required super.meanings,
    required this.binyan,
  });
}
