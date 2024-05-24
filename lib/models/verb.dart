import 'package:ani_lo_medaber_ivrit/models/abstract_word.dart';
import 'package:ani_lo_medaber_ivrit/models/binyan.dart';
import 'package:ani_lo_medaber_ivrit/models/stem.dart';
import 'package:ani_lo_medaber_ivrit/models/verb_info.dart';

class Verb extends AbstractWord {
  Verb({
    required this.binyan,
    required this.stem,
    required this.info,
    required this.samples,
    required super.valueHebrew,
    required super.transliteration,
    required super.meanings,
  });

  final Binyan binyan;
  final Stem stem;
  final VerbInfo info;
  final List<String> samples; // todo temporary
}
